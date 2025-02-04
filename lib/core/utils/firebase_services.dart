import 'dart:developer';

import 'package:evently/main.dart';
import 'package:evently/modules/home_screen/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseAuthServices {
  static bool validation = false;
  static final _firebase = FirebaseAuth.instance;

  static Future<UserCredential?> signUp({
    required String email,
    required String password,
    String name = '',
    String phone = '',
    String imageUrl = '',
  }) async {
    try {
      final UserCredential userCredential =
          await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = userCredential.user;
      user!.updateDisplayName(name);
      await user.sendEmailVerification();
      validation = true;
      return userCredential; // Return UserCredential for further actions
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e);
      validation = false;

      return null;

      // Indicate failure
    } catch (e) {
      validation = false;

      print(e); // Log other unexpected errors
      return null;
    }
  }

  static Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential? userCredential =
          await _firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      validation = true;
      return userCredential;
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e);
      validation = false;

      // return null;
    } catch (e) {
      validation = false;
    }
    return null;
  }

  static forgetPassword(String email) async {
    try {
      await _firebase.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e);
    } catch (e) {
      print(e); // Log other unexpected errors
    }
  }

  static void handleFirebaseAuthException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    } else if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    } else {
      print('An unexpected Firebase error occurred: ${e.code}');
    }
  }

  static User? getCurrentUser() {
    User? user = _firebase.currentUser;
    print((user!.uid == null) ? null : user!.uid);
    return user == null ? null : user;
  }

  static void logout() async {
    await _firebase.signOut();
  }

  static Future<UserCredential> signInWithGoogle(BuildContext context) async {
    // EasyLoading.show();
    await GoogleSignIn().signOut();
    // _firebase.signOut();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    // EasyLoading.dismiss();
    log("The Credential ${userCredential.user!.uid}");
    Navigator.pushNamedAndRemoveUntil(
      context,
      Home.routeName,
      (route) => false,
    );

    return userCredential;
  }
}

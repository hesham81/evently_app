import 'package:evently/core/services/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseServices {
  static Future<bool?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential? user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.value(false);
      } else if (e.code == 'wrong-password') {
        return Future.value(false);
      }
    } catch (e) {
      return Future.value(false);
    }
    return null;
  }
}

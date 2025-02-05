import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/utils/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/event_model.dart';

abstract class FireStoreServices {
  static String collectionName = "event";
  static final _firestore =
      FirebaseFirestore.instance.collection(collectionName);

  static CollectionReference<EventModel> collectionRef() {
    return _firestore.withConverter<EventModel>(
      fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
      toFirestore: (eventModel, _) => eventModel.toJson(),
    );
  }

  static Future<void> addNewEvent({required EventModel event}) async {
    try {
      log("Start");
      final CollectionReference colRef = collectionRef();
      var docId = event.id.toString();
      var docRef = colRef.doc(docId);

      await docRef.set(event);
      log("message");
    } catch (error) {
      log("Error: $error");
    }
  }

  static String generateId({
    required String value1,
    required String value2,
  }) {
    DateTime time = DateTime.now();
    String date = "${time.day}-${time.month}-${time.year}";
    value1 = value1.substring(0, 4).trim();
    value2 = value2.substring(0, 4).trim();
    return "$value1-$value2-$date";
  }

  static Future<List<EventModel>> getEvents() async {
    List<EventModel> events = [];
    await FirebaseFirestore.instance
        .collection(collectionName)
        .where("uid", isEqualTo: FirebaseAuthServices.getCurrentUser()!.uid)
        .get()
        .then((querySnapshot) {
      log("Successfully Completed");
      for (var docSnapshot in querySnapshot.docs) {
        events.add(
          EventModel.fromJson(
            docSnapshot.data(),
          ),
        );
        log(docSnapshot.data().toString());
        log("Length Of Document ${events.length.toString()}");
      }
    }, onError: (error) => log("Failed to complete: $error"));
    return events;
  }

  static Future<List<EventModel>> getLikesEvents() async {
    List<EventModel> events = [];
    await FirebaseFirestore.instance
        .collection(collectionName)
        .where(
          "uid",
          isEqualTo: FirebaseAuthServices.getCurrentUser()!.uid,
        )
        .where(
          "isLiked",
          isEqualTo: true,
        )
        .get()
        .then((querySnapshot) {
      log("Successfully Completed");
      for (var docSnapshot in querySnapshot.docs) {
        events.add(
          EventModel.fromJson(
            docSnapshot.data(),
          ),
        );
        log(docSnapshot.data().toString());
        log("Length Of Document ${events.length.toString()}");
      }
    }, onError: (error) => log("Failed to complete: $error"));
    return events;
  }

  static Stream<QuerySnapshot<Object?>> getStreamEvents() {
    User? user = FirebaseAuthServices.getCurrentUser();
    return collectionRef().snapshots();
  }

  static updateLiked({
    required String id,
    required bool isLiked,
  }) {
    _firestore.doc(id).update({
      "isLiked": isLiked,
    });
  }
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/event_model.dart';

abstract class FireStoreServices {
  static String collectionName = "event";
  static final _firestore =
      FirebaseFirestore.instance.collection(collectionName);

  static collectionRef() {
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
    value1 = value1.substring(0, 4);
    value2 = value2.substring(0, 4);
    return "${value1}-${value2}-$date";
  }
}

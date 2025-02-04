import 'package:evently/core/utils/firebase_services.dart';

class EventModel {
  late String id;

  final String event;
  final bool isLiked;

  final String uid;

  final String category;
  final DateTime eventDate;

  final String? lantitude;

  final String? longitude;
  final String imagePath;

  EventModel({
    required this.id,
    required this.event,
    this.isLiked = false,
    required this.uid,
    required this.category,
    required this.eventDate,
    this.lantitude,
    this.longitude,
    required this.imagePath,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      event: json['event'],
      isLiked: json['isLiked'],
      uid: json['uid'],
      category: json['category'],
      eventDate: DateTime.fromMillisecondsSinceEpoch(
        json['eventDate'],
      ),
      lantitude: json['latitude'],
      longitude: json['longitude'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event': event,
      'isLiked': isLiked,
      'uid': FirebaseAuthServices.getCurrentUser()!.uid,
      'category': category,
      'eventDate': eventDate.millisecondsSinceEpoch.toString(),
      'latitude': lantitude,
      'longitude': longitude,
      'imagePath': imagePath,
    };
  }
}

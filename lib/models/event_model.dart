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

  EventModel({
     required this.id,
    required this.event,
     this.isLiked = false,
    required this.uid,
    required this.category,
    required this.eventDate,
    this.lantitude,
    this.longitude,
  });
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      event: json['event'],
      isLiked: json['isLiked'],
      uid: json['uid'],
      category: json['category'],
      eventDate: DateTime.parse(json['eventDate']),
      lantitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event': event,
      'isLiked': isLiked,
      'uid': FirebaseAuthServices.getCurrentUser()!.uid,
      'category': category,
      'eventDate': eventDate.toIso8601String(),
      'latitude': lantitude,
      'longitude': longitude,
    };
  }
}

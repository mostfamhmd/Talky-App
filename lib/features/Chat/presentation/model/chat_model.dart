import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final dynamic senderId;
  final dynamic receiverId;
  final String message;
  final Timestamp timestamp;

  ChatModel(
      {required this.senderId,
      required this.receiverId,
      required this.message,
      required this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      "senderId": senderId,
      "receiverId": receiverId,
      "message": message,
      "timestamp": timestamp,
    };
  }
}

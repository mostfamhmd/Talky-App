import 'package:chat_app/features/Chat/presentation/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  String senderId = FirebaseAuth.instance.currentUser!.uid;
  Future<void> sendMessage(
      {required String receiverId, required String message}) async {
    final Timestamp timestamp = Timestamp.now();

    ChatModel newMessage = ChatModel(
        senderId: senderId,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);

    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .collection("-")
        .add(newMessage.toMap());
  }
}

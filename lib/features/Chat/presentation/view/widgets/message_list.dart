// ignore_for_file: must_be_immutable

import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/features/Chat/data/services/chat_services.dart';
import 'package:chat_app/features/Chat/presentation/view/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/Utils/styles.dart';

class MessagesList extends StatefulWidget {
  MessagesList(
      {super.key,
      required this.chatService,
      required this.receiverId,
      this.scrollController});
  final ChatService chatService;
  final String receiverId;
  ScrollController? scrollController;
  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  List<String> ids = [];
  String chatRoomId = "";
  @override
  void initState() {
    ids = [FirebaseAuth.instance.currentUser!.uid, widget.receiverId];
    ids.sort();
    chatRoomId = ids.join("_");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("ChatRoom")
          .doc(chatRoomId)
          .collection("-")
          .orderBy("timestamp", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Align(
            child: Text(
              "Error",
              style: AppStyles.kStyleNameChat16,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Align(
            child: CircularProgressIndicator(
              color: AppColor.kBlue,
            ),
          );
        }
        return ListView.builder(
          reverse: true,
          controller: widget.scrollController,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return ChatBubble(
                document: snapshot.data!.docs[index], isTail: index == 0);
          },
        );
      },
    );
  }
}

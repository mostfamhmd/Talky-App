import 'package:chat_app/features/Chat/presentation/view/widgets/chat_body.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView(
      {super.key,
      required this.friendName,
      required this.friendImage,
      required this.friendAbout,
      this.friendId});
  final String friendName;
  final String friendImage;
  final String friendAbout;
  final dynamic friendId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatBody(
        friendAbout: friendAbout,
        friendImage: friendImage,
        friendName: friendName,
        friendId: friendId,
      ),
    );
  }
}

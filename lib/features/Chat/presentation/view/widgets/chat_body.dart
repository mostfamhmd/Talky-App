// ignore_for_file: must_be_immutable
import 'package:chat_app/core/Services/send_notifications.dart';
import 'package:chat_app/features/Chat/data/services/chat_services.dart';
import 'package:chat_app/features/Chat/presentation/view/widgets/chat_app_bar.dart';
import 'package:chat_app/features/Chat/presentation/view/widgets/message_input.dart';
import 'package:chat_app/features/Chat/presentation/view/widgets/message_list.dart';
import 'package:chat_app/features/Home/presentation/view/widgets/home_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({
    super.key,
    required this.friendName,
    required this.friendImage,
    required this.friendAbout,
    required this.friendId,
    required this.friendToken,
  });
  final String friendName;
  final String friendImage;
  final String friendAbout;
  final String friendId;
  final String friendToken;
  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  TextEditingController controllerMessage = TextEditingController();
  ChatService chatService = ChatService();
  String myId = FirebaseAuth.instance.currentUser!.uid;
  MyNotification myNotification = MyNotification();
  void sendMessage() async {
    if (controllerMessage.text.isNotEmpty) {
      await chatService.sendMessage(
          receiverId: widget.friendId, message: controllerMessage.text);
      controllerMessage.clear();
    }
  }

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          ChatAppBar(
            chatAbout: widget.friendAbout,
            chatImage: widget.friendImage,
            chatName: widget.friendName,
          ),
          Expanded(
              child: MessagesList(
            chatService: chatService,
            receiverId: widget.friendId,
          )),
          MessageInput(
            scrollController: scrollController,
            controller: controllerMessage,
            onTap: () async {
              if (controllerMessage.text.isNotEmpty) {
                await chatService.sendMessage(
                    receiverId: widget.friendId,
                    message: controllerMessage.text);
                myNotification.sendNotification(
                    widget.friendToken, myName, controllerMessage.text);
                controllerMessage.clear();
              }
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

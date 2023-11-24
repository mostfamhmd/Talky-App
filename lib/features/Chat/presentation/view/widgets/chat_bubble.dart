import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.document, required this.isTail});
  final DocumentSnapshot document;
  final bool isTail;
  @override
  Widget build(BuildContext context) {
    bool isSender;
    if (document.get("senderId") == FirebaseAuth.instance.currentUser!.uid) {
      isSender = true;
    } else {
      isSender = false;
    }

    return BubbleSpecialThree(
      isSender: isSender,
      text: document.get('message'),
      color: isSender == false ? AppColor.kBlackMid : AppColor.kBlue,
      tail: isTail,
      textStyle: TextStyle(
          color: isSender == false ? Colors.white : Colors.white,
          fontSize: 16.sp),
    );
  }
}

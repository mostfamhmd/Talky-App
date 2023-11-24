// ignore_for_file: must_be_immutable

import 'package:chat_app/features/Chat/presentation/view/widgets/message_field.dart';
import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  MessageInput(
      {super.key,
      required this.controller,
      required this.onTap,
      this.scrollController});
  final TextEditingController controller;
  final Function()? onTap;
  ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MessageField(
            scrollController: scrollController,
            onTap: onTap,
            controller: controller,
            text: "Message",
          ),
        ),
      ],
    );
  }
}

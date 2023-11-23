import 'package:chat_app/core/Utils/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Divider(
        color: AppColor.kBlackLight,
        height: 20,
        thickness: 1.5,
      ),
    );
  }
}

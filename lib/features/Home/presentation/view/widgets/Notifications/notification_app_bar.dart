import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/core/widgets/back.dart';
import 'package:flutter/material.dart';

class NotificationsAppBar extends StatelessWidget {
  const NotificationsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Back(),
        const Spacer(),
        Text(
          "My Notifications",
          style:
              AppStyles.kStyleNameChat16.copyWith(fontWeight: FontWeight.w900),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}

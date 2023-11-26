import 'package:chat_app/features/Home/presentation/view/widgets/Notifications/notifications_body.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotificationsBody(),
    );
  }
}

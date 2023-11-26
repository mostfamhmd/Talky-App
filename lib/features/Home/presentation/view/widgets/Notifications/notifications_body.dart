import 'package:chat_app/features/Home/presentation/view/widgets/Notifications/notification_app_bar.dart';
import 'package:chat_app/features/Home/presentation/view/widgets/Notifications/notifications_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            const NotificationsAppBar(),
            const Expanded(
              child: NotificationsList(),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/features/Home/presentation/view/widgets/Notifications/notifications_items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Notifications")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("myNotifications")
            .orderBy("TimeNotification", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                "Error",
                style: AppStyles.kStyleNameChat16,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: AppColor.kBlue,
                ));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return NotificationsItems(
                document: snapshot.data!.docs[index],
              );
            },
          );
        });
  }
}

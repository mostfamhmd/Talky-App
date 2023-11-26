import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsItems extends StatelessWidget {
  const NotificationsItems({super.key, required this.document});
  final DocumentSnapshot document;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: AppColor.kBlackLight,
          height: 20,
          thickness: 1.5,
        ),
        SizedBox(
          width: double.infinity,
          height: 70.h,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    document.get("Name"),
                    style: AppStyles.kStyleNameChat16,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    document.get("Body"),
                    style: AppStyles.kStyleBlack14,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

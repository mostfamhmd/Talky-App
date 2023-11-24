import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/features/Chat/presentation/view/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserListView extends StatelessWidget {
  const UserListView({
    super.key,
    required this.urlImage,
    required this.userName,
    required this.userAbout,
    required this.userId,
  });
  final String urlImage;
  final String userName;
  final String userAbout;
  final dynamic userId;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ChatView(
              friendName: userName,
              friendImage: urlImage,
              friendAbout: userAbout,
              friendId: userId,
            ),
          ),
        );
      },
      child: Column(
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
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: urlImage,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(
                      color: AppColor.kBlue,
                    ),
                    errorWidget: (context, url, error) => Image.network(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
                    ),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: AppStyles.kStyleNameChat16,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      userAbout,
                      style: AppStyles.kStyleBlack14,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

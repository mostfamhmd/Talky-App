import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/core/Utils/styles.dart';
import 'package:chat_app/core/widgets/back.dart';
import 'package:chat_app/features/Chat/presentation/view/profile_friend_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar(
      {super.key,
      required this.chatName,
      required this.chatImage,
      required this.chatAbout});
  final String chatName;
  final String chatImage;
  final String chatAbout;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Back(),
            Text(
              chatName,
              style: AppStyles.kStyleNameChat16,
            ),
            InkWell(
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ProfileFriendView(
                      friendName: chatName,
                      friendAbout: chatAbout,
                      friendImage: chatImage,
                    ),
                  ),
                );
              },
              child: Container(
                height: 50.h,
                width: 50.w,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: CachedNetworkImage(
                  imageUrl: chatImage,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                    color: AppColor.kBlue,
                  ),
                  errorWidget: (context, url, error) => Image.network(
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: AppColor.kBlackLight,
          height: 20,
          thickness: 1.5,
        ),
      ],
    );
  }
}

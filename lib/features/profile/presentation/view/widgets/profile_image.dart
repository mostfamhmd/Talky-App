import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/core/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 200.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => const CircularProgressIndicator(
          color: AppColor.kBlue,
        ),
        errorWidget: (context, url, error) => Image.network(
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

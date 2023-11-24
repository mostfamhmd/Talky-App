import 'package:chat_app/features/Chat/presentation/view/widgets/Profile%20Friend/profile_friend_body.dart';
import 'package:flutter/material.dart';

class ProfileFriendView extends StatelessWidget {
  const ProfileFriendView(
      {super.key,
      required this.friendName,
      required this.friendImage,
      required this.friendAbout});
  final String friendName;
  final String friendImage;
  final String friendAbout;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileFriendBody(
          friendName: friendName,
          friendImage: friendImage,
          friendAbout: friendAbout),
    );
  }
}

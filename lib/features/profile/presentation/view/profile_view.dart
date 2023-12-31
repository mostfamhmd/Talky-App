import 'package:chat_app/features/Home/presentation/manager/Log%20Out/log_out_cubit.dart';
import 'package:chat_app/features/profile/presentation/manager/Edit%20Profile/edit_profile_cubit.dart';
import 'package:chat_app/features/profile/presentation/view/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView(
      {super.key,
      required this.myName,
      required this.myAbout,
      required this.myImage});

  final String myName, myAbout, myImage;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditProfileCubit(),
        ),
        BlocProvider(
          create: (context) => LogOutCubit(),
        ),
      ],
      child: Scaffold(
        body: ProfileBody(
          myname: myName,
          myabout: myAbout,
          myimage: myImage,
        ),
      ),
    );
  }
}

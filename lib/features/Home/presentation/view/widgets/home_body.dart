// ignore_for_file: non_constant_identifier_names

import 'package:chat_app/core/Utils/colors.dart';
import 'package:chat_app/features/Auth/presentation/view/auth.dart';
import 'package:chat_app/features/Home/presentation/manager/Log%20Out/log_out_cubit.dart';
import 'package:chat_app/features/Home/presentation/view/widgets/home_app_bar.dart';
import 'package:chat_app/features/Home/presentation/view/widgets/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String urlMyImage = "";
  String userMyName = "";
  String userMyAbout = "";
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool isLoadingLogOut = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogOutCubit, LogOutState>(
      listener: (context, state) {
        if (state is LogOutLoading) {
          isLoadingLogOut = true;
        } else if (state is LogOutSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const AuthView(),
            ),
          );
        } else if (state is LogOutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColor.kBlue,
              content: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              )));
          isLoadingLogOut = false;
        }
        setState(() {});
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            HomeAppBar(
              isLoading: isLoadingLogOut,
              userAbout: userMyAbout,
              userName: userMyName,
              userImage: urlMyImage,
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Align(
                          alignment: Alignment.center, child: Text("Error"));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            color: AppColor.kBlue,
                          ));
                    }

                    return ListView(
                      children: snapshot.data!.docs
                          .map<Widget>((doc) => Users(doc))
                          .toList(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget Users(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;
    String urlImage = data["UserImage"] ??
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
    String userName = data["UserName"] ?? "";
    String userAbout = data["AboutMe"] ?? "";

    if (firebaseAuth.currentUser!.email != data["email"]) {
      return UserListView(
        urlImage: urlImage,
        userName: userName,
        userAbout: userAbout,
      );
    } else {
      urlMyImage = data["UserImage"] ??
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
      userMyName = data["UserName"] ?? "";
      userMyAbout = data["AboutMe"] ?? "";
      return Center();
    }
  }
}

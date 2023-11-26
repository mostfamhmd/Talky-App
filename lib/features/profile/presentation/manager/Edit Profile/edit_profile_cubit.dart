// ignore_for_file: unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  editProfile(
      {required String aboutMe,
      required String image,
      required String userName}) async {
    emit(EditProfileLoading());
    try {
      await users.doc(FirebaseAuth.instance.currentUser!.uid).update(
          {"UserImage": image, "UserName": userName, "AboutMe": aboutMe});
      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileFailure(errorMessage: e.toString()));
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

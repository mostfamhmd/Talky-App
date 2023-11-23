import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'about_me_state.dart';

class AboutMeCubit extends Cubit<AboutMeState> {
  AboutMeCubit() : super(AboutMeInitial());
  aboutMe({required String aboutMe, required String image}) {
    emit(AboutMeLoading());
    try {
       FirebaseFirestore.instance.collection("users").doc("uid").update({
        "AboutMe": aboutMe,
        "UserImage": image,
      });
      emit(AboutMeSuccess());
    } catch (e) {
      emit(AboutMeFailure(errorMessage: e.toString()));
      print("${e.toString()}");
    }
  }
}

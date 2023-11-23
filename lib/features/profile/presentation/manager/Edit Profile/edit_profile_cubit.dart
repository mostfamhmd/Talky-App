import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  editProfile(
      {required String aboutMe,
      required String image,
      required String userName}) async{
    emit(EditProfileLoading());
    try {
      await FirebaseFirestore.instance.collection("users").doc("uid").update({
        "AboutMe": aboutMe,
        "UserImage": image,
        "UserName": userName,
      });
      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileFailure(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}

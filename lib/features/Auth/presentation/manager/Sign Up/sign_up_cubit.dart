import 'package:bloc/bloc.dart';
import 'package:chat_app/features/Auth/data/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  AuthServices authServices = AuthServices();

  signUp(
      {required String email,
      required String password,
      required String userName,
      required String aboutMe,
      required String userImage}) async {
    emit(SignUpLoading());
    try {
      await authServices.signUpWithEmailAndPassword(
          email, password, userName, userImage, aboutMe);
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailed(errorMessage: 'weak password'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailed(errorMessage: 'email already in use'));
      } else {
        emit(SignUpFailed(errorMessage: e.toString()));
      }
    } catch (e) {
      emit(SignUpFailed(errorMessage: e.toString()));
    }
  }
}

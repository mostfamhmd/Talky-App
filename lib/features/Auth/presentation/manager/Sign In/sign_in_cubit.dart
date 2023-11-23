import 'package:bloc/bloc.dart';
import 'package:chat_app/features/Auth/data/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  AuthServices authServices = AuthServices();
  signIn({required String email, required String password}) async {
    emit(SignInLoading());
    try {
      await authServices.signInWithEmailAndPassword(email, password);

      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailed(errorMessage: "User not found"));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailed(errorMessage: "Wrong Password"));
      } else {
        emit(SignInFailed(errorMessage: "some thing wrong"));
      }
    } catch (e) {
      emit(SignInFailed(errorMessage: e.toString()));
    }
  }
}

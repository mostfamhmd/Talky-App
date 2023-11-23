import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit() : super(LogOutInitial());
  logOut({required bool isLogOut}) {
    if (isLogOut == true) {
      emit(LogOutLoading());
      try {
        FirebaseAuth.instance.signOut();
        emit(LogOutSuccess());
      } on FirebaseAuthException catch (e) {
        emit(LogOutFailure(errorMessage: e.toString()));
        isLogOut = false;
      } catch (e) {
        emit(LogOutFailure(errorMessage: e.toString()));
        isLogOut = false;
      }
    }
  }
}

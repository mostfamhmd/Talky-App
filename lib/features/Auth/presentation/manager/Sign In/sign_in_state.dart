part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInSuccess extends SignInState {}

final class SignInFailed extends SignInState {
  final String errorMessage;

  SignInFailed({required this.errorMessage});
}

final class SignInLoading extends SignInState {}

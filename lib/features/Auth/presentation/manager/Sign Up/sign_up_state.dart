part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFailed extends SignUpState {
  late final String errorMessage;

  SignUpFailed({required this.errorMessage});
}

final class SignUpLoading extends SignUpState {}

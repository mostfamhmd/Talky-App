part of 'about_me_cubit.dart';

@immutable
sealed class AboutMeState {}

final class AboutMeInitial extends AboutMeState {}

final class AboutMeLoading extends AboutMeState {}

final class AboutMeSuccess extends AboutMeState {}

final class AboutMeFailure extends AboutMeState {
  final String errorMessage;

  AboutMeFailure({required this.errorMessage});
}

part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSucsess extends SignUpState {
  final UserModel userModel;

  SignUpSucsess({required this.userModel});
}

final class SignUpFailure extends SignUpState {
  final String message;

  SignUpFailure({required this.message});
}

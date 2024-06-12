part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSucsess extends LoginState {
  final UserModel userModel;

  LoginSucsess({required this.userModel});
}

final class LoginFailure extends LoginState {
  final String message;

  LoginFailure({required this.message});
}

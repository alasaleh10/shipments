part of 'choose_users_cubit.dart';

sealed class ChooseUsersState {}

final class ChooseUsersInitial extends ChooseUsersState {}

final class ChooseUsersLoading extends ChooseUsersState {}

final class ChooseUsersFailure extends ChooseUsersState {
  final String message;

  ChooseUsersFailure({required this.message});
}

final class ChooseUsersSucsess extends ChooseUsersState {
  final List<UserModel> users;

  ChooseUsersSucsess({required this.users});
}

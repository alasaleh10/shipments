part of 'add_admin_cubit.dart';

sealed class AddAdminState {}

final class AddAdminInitial extends AddAdminState {}

final class AddAdminLoading extends AddAdminState {}

final class AddAdminFailure extends AddAdminState {
  final String message;

  AddAdminFailure({required this.message});
}

final class AddAdminSucsess extends AddAdminState {
  final UserModel userModel;

  AddAdminSucsess({required this.userModel});
}

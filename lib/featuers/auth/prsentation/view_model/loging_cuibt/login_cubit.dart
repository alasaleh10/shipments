import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/featuers/auth/data/auth_repo.dart';
import 'package:shipment/featuers/auth/data/user_model.dart';
import 'package:shipment/helper/cached_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());
  final key = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  void login() async {
    if (key.currentState!.validate()) {
      emit(LoginLoading());
      var response =
          await authRepo.login(email: email.text, password: password.text);
      response.fold((failure) {
        emit(LoginFailure(message: failure.errorMessage));
      }, (userModel) {
        if (userModel.userType == 1) {
          CacheHelper.saveData(key: 'admin', value: true);
        } else {
          CacheHelper.saveData(key: 'admin', value: false);
        }
        CacheHelper.saveData(key: 'id', value: userModel.userId);
        emit(LoginSucsess(userModel: userModel));
      });
    }
  }
}

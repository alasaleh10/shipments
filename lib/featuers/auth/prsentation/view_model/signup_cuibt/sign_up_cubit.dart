import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/featuers/auth/data/auth_repo.dart';
import 'package:shipment/featuers/auth/data/user_model.dart';
import 'package:shipment/helper/cached_helper.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final key = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void signUp() async {
    if (key.currentState!.validate()) {
      emit(SignUpLoading());
      var response = await authRepo.signUp(
          name: name.text, email: email.text, password: password.text);
      response.fold((failure) {
        emit(SignUpFailure(message: failure.errorMessage));
      }, (userModel) {
        if (userModel.userType == 1) {
          CacheHelper.saveData(key: 'admin', value: true);
        } else {
          CacheHelper.saveData(key: 'admin', value: false);
        }
        CacheHelper.saveData(key: 'id', value: userModel.userId);
        emit(SignUpSucsess(userModel: userModel));
      });
    }
  }
}

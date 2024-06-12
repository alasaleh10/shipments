import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/featuers/admin/add_admin/repo.dart';
import 'package:shipment/featuers/auth/data/user_model.dart';

part 'add_admin_state.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  final AddAdminRepo addAdminRepo;
  AddAdminCubit(this.addAdminRepo) : super(AddAdminInitial());
  final key = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  void addAdmin() async {
    if (key.currentState!.validate()) {
      emit(AddAdminLoading());
      var response = await addAdminRepo.addAdmin(
          name: name.text, email: email.text, password: password.text);
      response.fold((failure) {
        emit(AddAdminFailure(message: failure.errorMessage));
      }, (sucsess) {
        name.clear();
        email.clear();
        password.clear();
        emit(AddAdminSucsess(userModel: sucsess));
      });
    }
  }
}

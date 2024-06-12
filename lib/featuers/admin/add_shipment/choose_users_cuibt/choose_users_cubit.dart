import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/featuers/admin/add_shipment/data/add_shipment_repo.dart';

import '../../../auth/data/user_model.dart';

part 'choose_users_state.dart';

class ChooseUsersCubit extends Cubit<ChooseUsersState> {
  final AddShipmentRepo addShipmentRepo;
  ChooseUsersCubit(this.addShipmentRepo) : super(ChooseUsersInitial());

  void searchUser(String name) async {
    if (name.trim().isEmpty) {
      emit(ChooseUsersInitial());
    } else {
      emit(ChooseUsersLoading());
      var response = await addShipmentRepo.searchUser(name);
      response.fold((failure) {
        emit(ChooseUsersFailure(message: failure.errorMessage));
      }, (users) {
        emit(ChooseUsersSucsess(users: users));
      });
    }
  }
}

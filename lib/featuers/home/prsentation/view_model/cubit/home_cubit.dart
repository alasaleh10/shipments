import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/featuers/admin/edit_shipment/data/shipment_model.dart';
import 'package:shipment/featuers/home/data/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final number = TextEditingController();

  void getShipment() async {
    emit(HomeLoading());
    var response = await homeRepo.getUserShipment(number.text);
    response.fold((failure) {
      emit(HomeFailure(message: failure.errorMessage));
    }, (shipmentModel) {
      emit(HomeSucsess(shipmentModel: shipmentModel));
    });
  }
}

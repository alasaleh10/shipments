import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/featuers/admin/add_shipment/data/add_shipment_repo.dart';
import 'package:shipment/featuers/admin/add_shipment/data/shipment_adding_model.dart';

part 'add_shipment_state.dart';

class AddShipmentCubit extends Cubit<AddShipmentState> {
  AddShipmentCubit(this.addShipmentRepo) : super(AddShipmentInitial());
  final AddShipmentRepo addShipmentRepo;
  int? userId;
  File? file;
  final key = GlobalKey<FormState>();
  final userName = TextEditingController();
  final senderName = TextEditingController();
  final senderPhone = TextEditingController();
  final reciverName = TextEditingController();
  final reciverPhone = TextEditingController();
  final shipmentNumber = TextEditingController();
  final shipmentDiscreption = TextEditingController();
  final from = TextEditingController();
  final to = TextEditingController();
  final deliveryPhone = TextEditingController();

  void chooseUse({required int userId, required String name}) {
    userName.text = name;
    this.userId = userId;
    emit(AddShipmentInitial());
  }

  void cheekData() {
    if (key.currentState!.validate()) {
      if (file == null) {
        emit(AddShipmentIFailure(message: 'إختر صورة الشحنة'));
      } else if (userId == null) {
        emit(AddShipmentIFailure(message: 'إختر العميل'));
      } else {
        addShipment();
      }
    }
  }

  void addShipment() async {
    emit(AddShipmentLoading());
    AddingModel addingModel = AddingModel(
        senderName: senderName.text,
        senderPhone: senderPhone.text,
        reciverName: reciverName.text,
        reciverPhone: reciverPhone.text,
        shipmenNumber: shipmentNumber.text,
        shipmentDescreption: shipmentDiscreption.text,
        from: from.text,
        to: to.text,
        deliveryPhone: deliveryPhone.text,
        userId: userId!,
        file: file!);
    var response = await addShipmentRepo.addShipment(addingModel);
    response.fold((failure) {
      emit(AddShipmentIFailure(message: failure.errorMessage));
    }, (r) {
      senderName.clear();
      senderPhone.clear();
      reciverName.clear();
      reciverPhone.clear();
      shipmentNumber.clear();
      shipmentDiscreption.clear();
      from.clear();
      to.clear();
      userName.clear();
      userId = null;
      file = null;
      deliveryPhone.clear();
      emit(AddShipmentSucsess());
    });
  }
}

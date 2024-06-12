import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment/featuers/admin/edit_shipment/data/shipment_admin_repo.dart';
import 'package:shipment/featuers/admin/edit_shipment/data/shipment_model.dart';

part 'edit_shipment_state.dart';

class EditShipmentCubit extends Cubit<EditShipmentState> {
  final ShipmentAdminRepo shipmentAdminRepo;
  EditShipmentCubit(this.shipmentAdminRepo) : super(EditShipmentInitial());
  final shipment = TextEditingController();
  final location = TextEditingController();
  int? status, id;

  void searchShipment() async {
    emit(EditShipmentLoading());
    var response =
        await shipmentAdminRepo.searchShipment(shipment: shipment.text);
    response.fold((failure) {
      emit(EditShipmentFailure(message: failure.errorMessage));
    }, (shipmentModel) {
      location.text = shipmentModel.shipmentCurrrentLocation!;
      status = shipmentModel.shipmentStatus;
      id = shipmentModel.shipmentId;
      emit(EditShipmentSucsess(shipmentModel: shipmentModel));
    });
  }

  void editeShipment() async {
    emit(EditShipmentLoading2());
    var response = await shipmentAdminRepo.editeShipment(
        id: id!, location: location.text, status: status!);
        response.fold((failure) 
        {
          emit(EditShipmentFailure2(message: failure.errorMessage));
        }, (r) 
        {
          emit(EditShipmentSucsess2());
        });
  }
}

part of 'edit_shipment_cubit.dart';

sealed class EditShipmentState {}

final class EditShipmentInitial extends EditShipmentState {}

final class EditShipmentFailure extends EditShipmentState {
  final String message;

  EditShipmentFailure({required this.message});
}

final class EditShipmentFailure2 extends EditShipmentState {
  final String message;

  EditShipmentFailure2({required this.message});
}

final class EditShipmentLoading extends EditShipmentState {}

final class EditShipmentLoading2 extends EditShipmentState {}

final class EditShipmentSucsess extends EditShipmentState {
  final ShipmentModel shipmentModel;

  EditShipmentSucsess({required this.shipmentModel});
}

final class EditShipmentSucsess2 extends EditShipmentState {}

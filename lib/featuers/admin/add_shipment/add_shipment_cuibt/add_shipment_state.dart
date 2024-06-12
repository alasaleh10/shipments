part of 'add_shipment_cubit.dart';

sealed class AddShipmentState {}

final class AddShipmentInitial extends AddShipmentState {}

final class AddShipmentLoading extends AddShipmentState {}

final class AddShipmentIFailure extends AddShipmentState {
  final String message;

  AddShipmentIFailure({required this.message});
}

final class AddShipmentSucsess extends AddShipmentState {}

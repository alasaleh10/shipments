import 'dart:io';

class AddingModel {
  final String senderName,
      senderPhone,
      reciverName,
      reciverPhone,
      shipmenNumber,
      shipmentDescreption,
      from,
      to,
      deliveryPhone;
  final int userId;
  final File file;

  AddingModel(
      {required this.senderName,
      required this.senderPhone,
      required this.reciverName,
      required this.reciverPhone,
      required this.shipmenNumber,
      required this.shipmentDescreption,
      required this.from,
      required this.to,
      required this.deliveryPhone,
      required this.userId,
      required this.file});
}

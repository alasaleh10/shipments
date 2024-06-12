class ShipmentModel {
  int? shipmentId;
  String? senderName;
  String? senderPhone;
  String? reciverName;
  String? reciverPhone;
  String? shipmentDiscription;
  String? shipmentCurrrentLocation;
  int? shipmentStatus;
  String? shipmentintber;
  String? shipmentFrom;
  String? shipmentTo;
  String? shipmentImage;
  String? deliveryPhone;
  int? idUser;
  String? shipmentDate;

  ShipmentModel({
    this.shipmentId,
    this.senderName,
    this.senderPhone,
    this.reciverName,
    this.reciverPhone,
    this.shipmentDiscription,
    this.shipmentCurrrentLocation,
    this.shipmentStatus,
    this.shipmentintber,
    this.shipmentFrom,
    this.shipmentTo,
    this.shipmentImage,
    this.deliveryPhone,
    this.idUser,
    this.shipmentDate,
  });

  factory ShipmentModel.fromJson(Map<String, dynamic> json) => ShipmentModel(
        shipmentId: int.tryParse(json['shipment_id'].toString()),
        senderName: json['sender_name']?.toString(),
        senderPhone: json['sender_phone']?.toString(),
        reciverName: json['reciver_name']?.toString(),
        reciverPhone: json['reciver_phone']?.toString(),
        shipmentDiscription: json['shipment_discription']?.toString(),
        shipmentCurrrentLocation:
            json['shipment_currrent_location']?.toString(),
        shipmentStatus: int.tryParse(json['shipment_status'].toString()),
        shipmentintber: json['shipment_intber']?.toString(),
        shipmentFrom: json['shipment_from']?.toString(),
        shipmentTo: json['shipment_to']?.toString(),
        shipmentImage: json['shipment_image']?.toString(),
        deliveryPhone: json['delivery_phone']?.toString(),
        idUser: int.tryParse(json['id_user'].toString()),
        shipmentDate: json['shipment_date']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (shipmentId != null) 'shipment_id': shipmentId,
        if (senderName != null) 'sender_name': senderName,
        if (senderPhone != null) 'sender_phone': senderPhone,
        if (reciverName != null) 'reciver_name': reciverName,
        if (reciverPhone != null) 'reciver_phone': reciverPhone,
        if (shipmentDiscription != null)
          'shipment_discription': shipmentDiscription,
        if (shipmentCurrrentLocation != null)
          'shipment_currrent_location': shipmentCurrrentLocation,
        if (shipmentStatus != null) 'shipment_status': shipmentStatus,
        if (shipmentintber != null) 'shipment_intber': shipmentintber,
        if (shipmentFrom != null) 'shipment_from': shipmentFrom,
        if (shipmentTo != null) 'shipment_to': shipmentTo,
        if (shipmentImage != null) 'shipment_image': shipmentImage,
        if (deliveryPhone != null) 'delivery_phone': deliveryPhone,
        if (idUser != null) 'id_user': idUser,
        if (shipmentDate != null) 'shipment_date': shipmentDate,
      };
}

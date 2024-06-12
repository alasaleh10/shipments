import 'package:dartz/dartz.dart';
import 'package:shipment/core/api/dio_handling_errors.dart';
import 'package:shipment/featuers/admin/edit_shipment/data/shipment_model.dart';

abstract class ShipmentAdminRepo {
  Future<Either<Failure,ShipmentModel>> searchShipment({required String shipment});
  Future<Either<Failure,dynamic>> editeShipment({required int id,required String location,required int status});

  
}
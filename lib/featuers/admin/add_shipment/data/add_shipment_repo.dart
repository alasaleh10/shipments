import 'package:dartz/dartz.dart';
import 'package:shipment/core/api/dio_handling_errors.dart';
import 'package:shipment/featuers/admin/add_shipment/data/shipment_adding_model.dart';
import 'package:shipment/featuers/auth/data/user_model.dart';

abstract class AddShipmentRepo {
  Future<Either<Failure, List<UserModel>>> searchUser(String name);
  Future<Either<Failure, dynamic>> addShipment(AddingModel addingModel);
}

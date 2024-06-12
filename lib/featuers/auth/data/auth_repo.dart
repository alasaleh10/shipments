import 'package:shipment/core/api/dio_handling_errors.dart';
import 'package:shipment/featuers/auth/data/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signUp(
      {required String name, required String email, required String password});
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password});
}

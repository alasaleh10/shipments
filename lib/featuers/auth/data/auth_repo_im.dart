import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shipment/core/api/dio_handling_errors.dart';
import 'package:shipment/core/api/dio_helper.dart';
import 'package:shipment/core/api/end_points.dart';
import 'package:shipment/featuers/auth/data/auth_repo.dart';
import 'package:shipment/featuers/auth/data/user_model.dart';

class AuthRepoIm implements AuthRepo {
  final DioHelper dioHelper;

  AuthRepoIm({required this.dioHelper});
  @override
  Future<Either<Failure, UserModel>> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      var response = await dioHelper.postData(
          endPoint: EndPoint.signup,
          data: {'name': name, 'email': email, 'password': password});
      UserModel userModel = UserModel.fromJson(response['data']);
      return right(userModel);
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    try {
      var response = await dioHelper.postData(
          endPoint: EndPoint.login,
          data: {'email': email, 'password': password});
      UserModel userModel = UserModel.fromJson(response['data']);
      return right(userModel);
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
}

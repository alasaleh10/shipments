import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shipment/core/api/dio_handling_errors.dart';
import 'package:shipment/core/api/dio_helper.dart';
import 'package:shipment/featuers/auth/data/user_model.dart';

import '../../../core/api/end_points.dart';

abstract class AddAdminRepo {
  Future<Either<Failure, UserModel>> addAdmin(
      {required String name, required String email, required String password});
}

class AddAdminRepoIm implements AddAdminRepo {
  DioHelper dioHelper = DioHelper();
  @override
  Future<Either<Failure, UserModel>> addAdmin(
      {required String name,
      required String email,
      required String password}) async {
    try {
      var response = await dioHelper.postData(endPoint: EndPoint.signup, data: {
        'name': name,
        'email': email,
        'password': password,
        'type': 1
      });
      UserModel userModel = UserModel.fromJson(response['data']);
      return right(userModel);
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
}

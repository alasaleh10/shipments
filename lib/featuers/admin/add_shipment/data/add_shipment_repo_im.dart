import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:shipment/core/api/dio_handling_errors.dart';
import 'package:shipment/core/api/dio_helper.dart';
import 'package:shipment/core/api/end_points.dart';
import 'package:shipment/featuers/admin/add_shipment/data/shipment_adding_model.dart';

import 'package:shipment/featuers/auth/data/user_model.dart';

import 'add_shipment_repo.dart';

class AddShipmentRepoIm implements AddShipmentRepo {
  DioHelper dioHelper = DioHelper();
  @override
  Future<Either<Failure, List<UserModel>>> searchUser(String name) async {
    try {
      var response = await dioHelper
          .getData(endPoint: EndPoint.searchUser, parametrs: {'name': name});
      List<UserModel> users = [];
      for (var item in response['data']) {
        users.add(UserModel.fromJson(item));
      }
      return right(users);
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addShipment(AddingModel addingModel) async {
    String fileName = addingModel.file.path.split('/').last;
    var image =
        await MultipartFile.fromFile(addingModel.file.path, filename: fileName);

    try {
      await dioHelper.postData(endPoint: EndPoint.addShipment, data: {
        'senderName': addingModel.senderName,
        'senderphone': addingModel.senderPhone,
        'reciverName': addingModel.reciverName,
        'reciverPhone': addingModel.reciverPhone,
        'shipmentNumber': addingModel.shipmenNumber,
        'shipmentDiscreption': addingModel.shipmentDescreption,
        'from': addingModel.from,
        'to': addingModel.to,
        'deliveryPhone': addingModel.deliveryPhone,
        'userId': addingModel.userId,
        'file': image
      });
      return right(true);
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
}

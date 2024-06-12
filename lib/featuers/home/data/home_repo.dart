import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shipment/core/api/dio_handling_errors.dart';
import 'package:shipment/core/api/dio_helper.dart';
import 'package:shipment/core/api/end_points.dart';
import 'package:shipment/featuers/admin/edit_shipment/data/shipment_model.dart';
import 'package:shipment/helper/cached_helper.dart';

abstract class HomeRepo {
  Future<Either<Failure, ShipmentModel>> getUserShipment(String text);
}

class HomeRepoIm implements HomeRepo {
  DioHelper dioHelper = DioHelper();
  @override
  Future<Either<Failure, ShipmentModel>> getUserShipment(String text) async {
    try {
      var response = await dioHelper.getData(
          endPoint: EndPoint.getUserShipment,
          parametrs: {'id': CacheHelper.getData(key: 'id'),'text':text});
      ShipmentModel shipmentModel = ShipmentModel.fromJson(response['data']);
      return right(shipmentModel);
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
}

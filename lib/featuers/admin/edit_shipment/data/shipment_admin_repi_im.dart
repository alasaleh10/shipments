import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shipment/core/api/dio_handling_errors.dart';
import 'package:shipment/core/api/dio_helper.dart';
import 'package:shipment/core/api/end_points.dart';
import 'package:shipment/featuers/admin/edit_shipment/data/shipment_admin_repo.dart';
import 'package:shipment/featuers/admin/edit_shipment/data/shipment_model.dart';

class ShipmentAdminRepoIm implements ShipmentAdminRepo {
  DioHelper dioHelper = DioHelper();
  @override
  Future<Either<Failure, ShipmentModel>> searchShipment(
      {required String shipment}) async {
    try {
      var response = await dioHelper.getData(
          endPoint: EndPoint.searchShipment, parametrs: {'shipment': shipment});
      ShipmentModel shipmentModel = ShipmentModel.fromJson(response['data']);
      return right(shipmentModel);
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> editeShipment(
      {required int id, required String location, required int status}) async {
    try {
      await dioHelper.postData(
          endPoint: EndPoint.updateShipment,
          data: {'id': id, 'status': status, 'location': location});
      return right(true);
    } on DioException catch (e) {
      return left(Diohandling.fromDioError(e));
    } catch (e) {
      return left(Diohandling(e.toString()));
    }
  }
}

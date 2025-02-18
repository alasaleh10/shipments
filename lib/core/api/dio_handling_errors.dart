import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class Diohandling extends Failure {
  Diohandling(super.errorMessage);

  factory Diohandling.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Diohandling('انتهت مهلة الاتصال');
      case DioExceptionType.sendTimeout:
        return Diohandling("انتهت مهلة الارسال");
      case DioExceptionType.receiveTimeout:
        return Diohandling("انتهت مهلة الاستلام");
      case DioExceptionType.badResponse:
        return dioHandlinResponse(
            error.response!.statusCode, error.response!.data);

      case DioExceptionType.connectionError:
        return Diohandling("مشكلة في الاتصال");
      case DioExceptionType.cancel:
        return Diohandling("تم الغاء الاتصال");

      default:
        return Diohandling("حدثت مشكلة في الاتصال الرجاء المحاولة لاحقا");
    }
  }
}

dioHandlinResponse(int? statusCode, dynamic response) {
  log('log ${statusCode.toString()}');

  var res = jsonDecode(response);

  if (statusCode == 400) {
    //can changes
    return Diohandling(res['message']);
  } else if (statusCode == 404) {
    return Diohandling(res['message']);
  } else if (statusCode == 500) {
    return Diohandling('problem');
  } else {
    return Diohandling('خطاء المحاولة مرة اخرى');
  }
}

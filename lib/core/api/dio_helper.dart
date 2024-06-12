import 'dart:convert';

import 'package:dio/dio.dart';
import 'end_points.dart';

class DioHelper {
  final Dio _dio = Dio();
  final String _baseUrl = EndPoint.baseUrl;

  // Options options = ;

  Future getData(
      {required String endPoint,
      int sendTimeout = 5,
      int receiveTimeout = 5,
      Map<String, dynamic>? parametrs}) async {
    Response response = await _dio.get('$_baseUrl$endPoint',
        queryParameters: parametrs,
        options: Options(
          sendTimeout: Duration(seconds: sendTimeout),
          receiveTimeout: Duration(seconds: receiveTimeout),
        ));

    return jsonDecode(response.data);
  }

  Future postData(
      {required String endPoint,
      required dynamic data,
      int sendTimeout = 5,
      int receiveTimeout = 5}) async {
    var formData = FormData.fromMap(data);

    Response response = await _dio.post(
      '$_baseUrl$endPoint',
      data: formData,
      options: Options(
        sendTimeout: Duration(seconds: sendTimeout),
        receiveTimeout: Duration(seconds: receiveTimeout),
      ),
    );

    return jsonDecode(response.data);
  }
}

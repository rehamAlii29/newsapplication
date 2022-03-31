import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl:"https://newsapi.org/",
      receiveDataWhenStatusError: true,
    ));
  }
  // هجيب بها اداتا من ال api

  static Future<Response> getdata(
      {@required String? url, @required Map<String, dynamic>? query}) async {
    return await dio!.get(url!, queryParameters: query);
  }
}

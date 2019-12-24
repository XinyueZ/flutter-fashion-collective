import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fashion_collective/config.dart';

class ClientProvider extends ChangeNotifier {
  final Dio _dio = Dio();

  Dio get dio => _dio;

  ClientProvider(String apiKey) {
    _dio.options.baseUrl = HOST;
    _dio.options.queryParameters = {
      "pid": apiKey,
    };
  }
}

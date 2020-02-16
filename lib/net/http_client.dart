import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_fashion_collective/app_config/app_config.dart';
import 'package:flutter_fashion_collective/net/client.dart';

@immutable
class HttpClient implements Client {
  factory HttpClient({@required AppConfig appConfig}) {
    assert(appConfig is AppConfig);
    return HttpClient._(appConfig);
  }

  HttpClient._(this._appConfig) {
    _dio.options.baseUrl = _appConfig.host;
    _dio.options.queryParameters = <String, String>{
      "pid": _appConfig.apiKey,
    };
  }

  final Dio _dio = Dio();
  final AppConfig _appConfig;

  @override
  Future<dynamic> get(String url) => _dio.get<dynamic>(url);
}

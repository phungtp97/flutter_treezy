import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treezy/local/local.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'app.dart';
import 'core/service/network_inspector.dart';
import 'injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());
}

@module
abstract class RegisterService {

  SharedPrefService? _prefs;

  @preResolve
  @singleton
  Future<SharedPrefService> get prefs async {
    if(_prefs != null) return _prefs!;
    final sharedPrefService = SharedPrefService();
    await sharedPrefService.init();
    _prefs = sharedPrefService;
    return _prefs!;
  }

  @Named('trackerId')
  String get trackerId => '1234567890';

  @Named('env')
  String get env => 'dev';

  @Named('baseUrl')
  String get baseUrl => 'https://api.yourhost.com';

  @preResolve
  @singleton
  @Named('userDio')
  Future<Dio> get userDio async {
    final dio = Dio();

    dio.interceptors.add(DioLogInterceptor());
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          if (options.method == 'POST') {
            options.headers['Content-Type'] = 'application/json';
          }
          if (_prefs!.token != null &&
              !options.headers.containsKey('Authorization')) {
            options.headers['Authorization'] =
            'Bearer ${_prefs!.token}';
          }
          NetworkInspector().addLog();
          return handler.next(options);
        }, onResponse: (response, handler) async {
      NetworkInspector().addLog();
      return handler.next(response);
    }, onError: (e, handler) async {
      print(
          'api exception -- ${e.requestOptions.path} ${e.requestOptions.uri.path}');
      NetworkInspector().addLog();
      return handler.next(e);
    }));
    return dio;
  }

  @Named('publicDio')
  @singleton
  Dio get publicDio {
    final dio = Dio();

    return dio;
  }
}

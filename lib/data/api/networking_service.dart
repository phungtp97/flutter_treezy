import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../local/local.dart';

@singleton
class NetworkingService {
  final SharedPrefService _prefServices;

  final String baseUrl;
  final Dio _userDio;
  final Dio _publicDio;

  NetworkingService(
      {required SharedPrefService prefServices,
        @Named('baseUrl') required this.baseUrl,
        @Named('userDio') required Dio userDio,
        @Named('publicDio') required Dio publicDio})
      : _prefServices = prefServices,
        _userDio = userDio,
        _publicDio = publicDio;

  String? get currentToken => _prefServices.token;

// NetworkingService(this._ref) {
//   _sharedPrefServices = _ref.read(sharedPrefsProvider);
//   _dio = Dio();
//   _dio.interceptors.add(DioLogInterceptor());
//   _dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
//         if (options.method == 'POST') {
//           options.headers['Content-Type'] = 'application/json';
//         }
//         if (_sharedPrefServices.getCurrentToken() != null &&
//             !options.headers.containsKey('Authorization')) {
//           options.headers['Authorization'] =
//           'Bearer ${_sharedPrefServices.getCurrentToken()}';
//         }
//         notifyLogger();
//         return handler.next(options);
//       }, onResponse: (response, handler) async {
//     notifyLogger();
//     return handler.next(response);
//   }, onError: (e, handler) async {
//     print(
//         'api exception -- ${e.requestOptions.path} ${e.requestOptions.uri
//             .path}');
//     notifyLogger();
//     return handler.next(e.toAppError(e.toNetworkErrorEnum()));
//   }));
//
//   _publicOnlyDio = Dio();
//   _publicOnlyDio.interceptors.add(InterceptorsWrapper(
//       onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
//         if (options.method == 'POST') {
//           options.headers['Content-Type'] = 'application/json';
//         }
//         return handler.next(options);
//       }, onResponse: (response, handler) async {
//     return handler.next(response);
//   }, onError: (e, handler) async {
//     return handler.next(e.toAppError(e.toNetworkErrorEnum()));
//   }));
// }
}

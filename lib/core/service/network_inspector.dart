import 'dart:async';
import 'dart:collection';
import 'package:dio_log/bean/net_options.dart';
import 'package:dio_log/dio_log.dart';

class NetworkInspector {
  LinkedHashMap<String, NetOptions>? get logMap =>
      interceptor.logManage?.logMap;

  Stream<LinkedHashMap<String, NetOptions>?> get stream =>
      _logController.stream;

  final _logController =
      StreamController<LinkedHashMap<String, NetOptions>?>.broadcast();

  DioLogInterceptor get interceptor => _getInterceptor();

  void addLog() {
    _logController.sink.add(logMap);
  }

  DioLogInterceptor _getInterceptor() {
    return DioLogInterceptor();
  }

  static NetworkInspector? _instance;

  factory NetworkInspector() {
    _instance ??= NetworkInspector._internal();
    return _instance!;
  }

  NetworkInspector._internal();
}

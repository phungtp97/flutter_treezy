import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class ConnectivityService {
  final BehaviorSubject<ConnectivityResult> _connectionStatusController = BehaviorSubject<ConnectivityResult>();

  StreamSubscription<ConnectivityResult>? _subscription;
  ConnectivityResult? get currentConnectionStatus =>
      _connectionStatusController.valueOrNull;
  Stream<ConnectivityResult> get connectionStatusStream =>
      _connectionStatusController.stream;

  ConnectivityService() {
    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (_connectionStatusController.valueOrNull != result) {
        _connectionStatusController.add(result);
      }
    });
  }

  bool get isMobileConnection =>
      currentConnectionStatus == ConnectivityResult.mobile;

  bool get isWifiConnection =>
      currentConnectionStatus == ConnectivityResult.wifi;

  bool get hasInternetConnection => isMobileConnection || isWifiConnection;

  @disposeMethod
  dispose(){
    _connectionStatusController.close();
    _subscription?.cancel();
  }
}

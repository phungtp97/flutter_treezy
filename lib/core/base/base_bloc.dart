import 'dart:async';

import 'package:flutter_treezy/core/service/service.dart';
import 'base.dart';

class BaseBloc<S extends BaseState, C extends Command> extends Cubit<S> {
  BaseBloc(super.initialState);

  late final tracker = TrackerService(runtimeType.toString(), trackerConfiguration: GetIt.I.get());
  late final BehaviorSubject<Object> _errorController = BehaviorSubject<Object>();
  late final BehaviorSubject<C> _commandController = BehaviorSubject<C>();
  late final BehaviorSubject<bool> _loadingController = BehaviorSubject.seeded(false);

  // late final StreamSubscription<C> _commandSubscription = _commandController.stream.listen((event) {
  //   commandListener(event);
  // });

  bool get hasConnection => GetIt.I.get<ConnectivityService>().hasInternetConnection;

  Stream<bool> get loadingStream => _loadingController.stream;

  Stream<Object> get errorStream => _errorController.stream;

  Stream<C> get commandStream => _commandController.stream;

  set loading(bool s) => _loadingController.add(s);

  set command(C s) => _commandController.add(s);

  set error(Object s) => _errorController.add(s);

  @mustCallSuper
  void commandListener(C c) {
    tracker.trackCommand(TrackerParams(
      object: c,
    ));
  }

  @mustCallSuper
  void dispose() {
    _loadingController.close();
    _errorController.close();
    _commandController.close();
    //_commandSubscription.cancel();
  }
}

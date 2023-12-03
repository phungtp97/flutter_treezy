import 'dart:async';
import 'package:flutter/material.dart';
import 'base.dart';

abstract class BaseUiState<S extends StatefulWidget, B extends BaseBloc> extends BaseUiStateNoBloc<S> {
  B bloc = GetIt.I.get<B>();

  late final StreamSubscription<Command> _commandSubscription;

  BaseUiState(){
    _commandSubscription = bloc.commandStream.listen((event) {
      commandListener(event);
    });
  }

  void commandListener(Command c);

  @override
  void dispose() {
    bloc.dispose();
    _commandSubscription.cancel();
    super.dispose();
  }
}
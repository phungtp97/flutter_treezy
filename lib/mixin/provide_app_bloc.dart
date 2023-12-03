import 'package:flutter/material.dart';
import 'package:flutter_treezy/core/base/base.dart';
import '../blocs/blocs.dart';

mixin ProvideAppBlocStateMixin on BaseUiStateNoBloc {

  AppBloc get appBloc => GetIt.I.get();

  Stream<Locale> get localeStream => appBloc.localeStream;
}
import 'package:flutter/material.dart';
import '../../ui.dart';

abstract class BaseUiStateNoBloc<E extends StatefulWidget> extends State<E> {
  S get localization => S.of(context);

  push<T>(String name, {Object? arguments}) => Navigator.of(context).pushNamed<T>(name, arguments: arguments);

  pushAndRemoveUntil<T extends Object?>(
    String name, {
    RoutePredicate? predicate,
    Object? arguments,
  }) =>
      Navigator.of(context).pushNamedAndRemoveUntil(name, predicate ?? (route) => false, arguments: arguments);

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String name, {
    TO? result,
    Object? arguments,
  }) =>
      Navigator.of(context).popAndPushNamed(name, arguments: arguments, result: result);

  void pop<T extends Object?>([T? result]) => Navigator.of(context).pop(result);

  showLoadingDialog() {}

  closeLoadingDialog() {}
}

import 'dart:ui';
import '../../core/base/base_state.dart';

class AppState extends BaseState {
  final Locale? locale;

  AppState({
    AppState? state,
    Locale? locale,
  }) : locale = locale ?? state?.locale ?? const Locale('en');

  @override
  List<Object?> get props => [
        locale,
      ];
}

import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constant.dart';

String getAppLocale() {
  final prefs = GetIt.I.get<SharedPreferences>();
  final String locale = prefs.getString(SharedPrefsKey.languageCode) ??
      Platform.localeName.split('_').first;
  return locale;
}

String getDeviceLocale() {
  String locale = Platform.localeName;
  if (locale.contains("_")) {
    locale = locale.split("_")[0];
  }

  return locale.toLowerCase();
}

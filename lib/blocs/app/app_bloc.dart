import 'dart:ui';
import 'package:injectable/injectable.dart';
import '../../core/base/base_bloc.dart';
import '../../enums/enums.dart';
import '../../local/local.dart';
import '../../utils/helper/helper.dart';
import 'app_command.dart';
import 'app_state.dart';

@singleton
class AppBloc extends BaseBloc<AppState, AppCommand> {
  final SharedPrefService _sharedPrefs;

  AppBloc(this._sharedPrefs) : super(AppState(locale: const Locale('en', 'US')));

  @disposeMethod
  @override
  void dispose() {
    super.dispose();
  }

  Stream<Locale> get localeStream => stream
      .where((event) => event.locale != null)
      .map((event) => event.locale!)
      .distinct();

  Future<void> init() async {
    final languageCode = _sharedPrefs.language;
    emit(AppState(
      state: state,
      locale: LocaleBuilder.getLocale(languageCode),
    ));
  }

  Future<void> changeLanguage(String languageCode) async {
    await _sharedPrefs.setLanguage(languageCode);
    emit(AppState(
      locale: LocaleBuilder.getLocale(languageCode),
      state: state,
    ));
  }

  LanguageEnum get currentLanguage {
    final String languageCode = _sharedPrefs.language;
    return LocaleBuilder.getLocaleEnum(languageCode);
  }
}
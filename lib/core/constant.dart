import '../enums/enums.dart';

class AppConstant {
  AppConstant._();

  static const double mainBottomTabSize = 55;

  static const localeKeys = {
    LanguageEnum.en: 'en',
    LanguageEnum.vi: 'vi'
  };
}

class SharedPrefsKey {
  SharedPrefsKey._();

  static const String languageCode = 'languageCode';
  static const String token = 'token';
}
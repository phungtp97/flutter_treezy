import 'package:flutter/material.dart';
import 'package:flutter_treezy/enums/common_enums.dart';

class LocaleBuilder {
  static Locale getLocale(String languageCode) {
    switch (languageCode) {
      case 'vi':
        return Locale(LanguageEnum.vi.name, 'VN');
      case 'en':
      default:
        return Locale(LanguageEnum.en.name, 'US');
    }
  }

  static LanguageEnum getLocaleEnum(String languageCode) {
    switch (languageCode) {
      case 'vi':
        return LanguageEnum.vi;
      case 'en':
      default:
        return LanguageEnum.en;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../enums/common_enums.dart';
part 'appbar/appbar_dimens.dart';
part 'navigation_bar/navigation_bar_dimens.dart';
part 'dialog/dialog_dimens.dart';

class Dimens {
  Dimens._();

  static const borderRadiusEnum = BorderRadiusEnum.all;

  ///All phone dimension classes [AppBarDimensions], [NavigationBarDimensions]
  static const _appBarPhone = AppBarDimensions.phone();

  static const _navigationBarPhone = NavigationBarDimensions.phone();

  static const _dialogPhone = DialogDimensions.phone();

  ///All tablet dimension classes [NavigationBarDimensions], [AppBarDimensions]
  static const _navigationBarTablet = NavigationBarDimensions.tablet();

  static const _appbarTablet = AppBarDimensions.tablet();

  static const _dialogTablet = DialogDimensions.tablet();

  static AppBarDimensions appBar(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)) {
      return _appBarPhone;
    } else {
      return _appbarTablet;
    }
  }

  static NavigationBarDimensions navigationBar(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)) {
      return _navigationBarPhone;
    } else {
      return _navigationBarTablet;
    }
  }

  static DialogDimensions dialog(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)) {
      return _dialogPhone;
    } else {
      return _dialogTablet;
    }
  }
}

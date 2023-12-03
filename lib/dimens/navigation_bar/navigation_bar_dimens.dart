part of '../dimens.dart';

class NavigationBarDimensions {
  final double height ;

  const NavigationBarDimensions._(this.height);

  const NavigationBarDimensions.phone()
      : height = 58;

  const NavigationBarDimensions.tablet()
      : height = 58;
}
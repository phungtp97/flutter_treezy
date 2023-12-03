part of '../dimens.dart';

class AppBarDimensions {
  final double leadingSize;
  final EdgeInsets leadingPadding;
  final double height;

  const AppBarDimensions._(this.leadingSize, this.leadingPadding, this.height);

  const AppBarDimensions.phone()
      : leadingSize = 24,
        height = 58,
        leadingPadding =
        const EdgeInsets.symmetric(vertical: 17, horizontal: 20);
  const AppBarDimensions.tablet()
      : leadingSize = 24,
        height = 58,
        leadingPadding =
        const EdgeInsets.symmetric(vertical: 17, horizontal: 20);
}

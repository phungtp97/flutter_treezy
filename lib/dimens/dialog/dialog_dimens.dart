part of '../dimens.dart';

class DialogDimensions {
  final double buttonBarHeight;
  final EdgeInsets dialogPadding;
  final BorderRadiusEnum borderRadiusEnum;

  const DialogDimensions._(
      this.buttonBarHeight, this.dialogPadding, this.borderRadiusEnum);

  const DialogDimensions.phone()
      : buttonBarHeight = 44,
        borderRadiusEnum = BorderRadiusEnum.all,
        dialogPadding =
            const EdgeInsets.symmetric(vertical: 17, horizontal: 20);

  const DialogDimensions.tablet()
      : buttonBarHeight = 60,
        borderRadiusEnum = BorderRadiusEnum.all,
        dialogPadding =
            const EdgeInsets.symmetric(vertical: 17, horizontal: 20);
}

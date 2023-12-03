import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../../ui.dart';
import '../kit/dialog_design_kit.dart';
import 'alert_dialog_widget.dart';
import 'button.dart';

Future showConfirmDialog({
  required BuildContext context,
  required String title,
  bool canDismiss = false,
}) async {
  return SmartDialog.show(
      backDismiss: canDismiss,
      clickMaskDismiss: canDismiss,
      maskColor: Theme.of(context).snackBarTheme.disabledActionTextColor,
      builder: (context) => _dialogBody(
            context: context,
            child: DialogDesignKit(context)
                .setHeadLine(
                  DialogBar(
                    showCloseBtn: true,
                    titleText: title,
                  ),
                )
                .setButton(DialogButton(
                  title: title,
                  onTap: () {
                    SmartDialog.dismiss();
                  },
                ))
                .build(),
          ));
}

Future showYesNoDialog({
  required BuildContext context,
  required String title,
  required String body,
  required Function onConfirm,
  Function? onCancel,
  DialogBody? customBody,
  bool canDismiss = false,
}) async {
  return SmartDialog.show(
      backDismiss: canDismiss,
      clickMaskDismiss: canDismiss,
      maskColor: Theme.of(context).snackBarTheme.disabledActionTextColor,
      builder: (context) => _dialogBody(
            context: context,
            child: DialogDesignKit(context)
                .setHeadLine(
                  DialogBar(
                    showCloseBtn: true,
                    titleText: title,
                  ),
                )
                .setButton(DialogButton(
                  title: title,
                  onTap: () {
                    SmartDialog.dismiss();
                  },
                ))
                .setBody(customBody ??
                    DialogBody(
                      bodyTitle: body,
                    ))
                .build(),
          ));
}

Widget _dialogBody({required BuildContext context, required Widget child}) =>
    Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2))),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.5,
        insetPadding: Dimens.dialog(context).dialogPadding,
        child: Container(
            constraints: const BoxConstraints(minHeight: 160),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(2)),
                child: child)));

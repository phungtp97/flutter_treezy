import 'package:flutter/material.dart';
import '../dialog/alert_dialog_widget.dart';
import '../dialog/button.dart';

class DialogDesignKit {
  late DialogBar _dialogHeadLine;
  late DialogIcon _icon;
  late DialogBody _body;
  final BuildContext context;
  final List<DialogButton> _buttons = [];
  CrossAxisAlignment? _crossAxisAlignment;
  MainAxisAlignment? _mainAxisAlignment;
  DialogDesignKit(this.context);

  DialogDesignKit setHeadLine(DialogBar dialogBar) {
    _dialogHeadLine = dialogBar;
    return this;
  }

  DialogDesignKit setIcon(DialogIcon dialogIcon) {
    _icon = dialogIcon;
    return this;
  }

  DialogDesignKit setBody(DialogBody? dialogBody) {
    if(dialogBody != null) {
      _body = dialogBody;
    };
    return this;
  }

  DialogDesignKit setButton(DialogButton button){
    _buttons.add(button);
    return this;
  }

  DialogDesignKit setCrossAxisAlignment(CrossAxisAlignment contentAlignment) {
    _crossAxisAlignment = contentAlignment;
    return this;
  }

  AlertDialogWidget build() {
    AlertDialogWidget alertDialogWidget = AlertDialogWidget(
      context: context,
      dialogButtons: _buttons,
      dialogBody: _body,
      dialogIcon: _icon,
      crossAxisAlignment: _crossAxisAlignment ?? CrossAxisAlignment.start,
      dialogHeadline: _dialogHeadLine,
      mainAxisAlignment: _mainAxisAlignment ?? MainAxisAlignment.center
    );
    return alertDialogWidget;
  }
}

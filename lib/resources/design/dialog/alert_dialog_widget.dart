// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

// ignore: implementation_imports

import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';

import '../../../ui.dart';
import '../design.dart';

class AlertDialogWidget extends StatefulWidget {
  final Widget dialogHeadline;
  final Widget dialogIcon;
  final Widget dialogBody;
  final List<Widget> dialogButtons;
  final double? buttonBarHeight;
  final BuildContext context;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const AlertDialogWidget(
      {required this.dialogHeadline,
      required this.dialogBody,
      required this.dialogIcon,
      required this.dialogButtons,
      required this.context,
      this.buttonBarHeight,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.mainAxisAlignment = MainAxisAlignment.spaceBetween});

  @override
  AlertDialogWidgetState createState() => AlertDialogWidgetState();
}

class AlertDialogWidgetState extends State<AlertDialogWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.dialogHeadline,
            widget.dialogIcon,
          ],
        ),
        widget.dialogBody,
        SizedBox(
            height: widget.buttonBarHeight ??
                Dimens.dialog(context).buttonBarHeight,
            child: Row(
              children: widget.dialogButtons,
            ))
      ],
    );
  }
}

class DialogBar extends StatelessWidget {
  final Widget? titleWidget;
  final Widget? closeBtnWidget;
  final bool showCloseBtn;
  String? titleText;

  DialogBar(
      {this.closeBtnWidget,
      this.titleWidget,
      this.showCloseBtn = false,
      this.titleText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          titleWidget == null
              ? Container(
                  height: 24,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        //width: 200,
                        child: (titleText ?? '')
                            .bold(data: TextDesignData(fontSize: 16))),
                  ],
                ),
          showCloseBtn
              ? closeBtnWidget != null
                  ? closeBtnWidget!
                  : Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                              onTap: () {
                                SmartDialog.dismiss();
                              },
                              child: const Icon(
                                Icons.close,
                                size: 16,
                                color: ColorKit.red4,
                              ).pad(4).rectAll(10,
                                  color:
                                      const Color.fromRGBO(253, 224, 224, 1.0)))
                          .pad(0, 8, 0),
                    )
              : Container(
                  height: 0,
                )
        ],
      ),
    );
  }
}

class DialogBody extends StatelessWidget {
  final Widget? dialogBody;
  final double? width;
  final double? height;
  final String? content;
  String? bodyTitle;

  DialogBody(
      {this.dialogBody, this.width, this.height, this.content, this.bodyTitle});

  @override
  Widget build(BuildContext context) {
    double w = width != null ? width! : 420;
    double h = height != null ? height! : 400;

    if (dialogBody != null) {
      return dialogBody!;
    } else {
      return content != null
          ? Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  bodyTitle != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: bodyTitle!.text
                              .copyStyle(
                                  Theme.of(context).textTheme.titleMedium)
                              .weight(FontWeight.w600)
                              .b(),
                        )
                      : const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  Container(
                      constraints: BoxConstraints(maxHeight: w, maxWidth: h),
                      child: SingleChildScrollView(
                              padding: EdgeInsets.zero,
                              child: GestureDetector(
                                child: '$content'
                                    .text
                                    .copyStyle(
                                        Theme.of(context).textTheme.caption)
                                    .weight(FontWeight.w400)
                                    .b(),
                                onLongPress: () {
                                  Clipboard.setData(
                                      ClipboardData(text: '$content'));
                                  SmartDialog.showToast('Copied',
                                      animationTime:
                                          const Duration(milliseconds: 1000),
                                      alignment: Alignment.center,
                                      builder: (_) => SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .dialogBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: ColorKit.black1,
                                                    spreadRadius: 0,
                                                    blurRadius: 8,
                                                    offset: Offset(0, 4),
                                                  ),
                                                ],
                                              ),
                                              child:
                                                  'Copied'.text.b().marg(12, 8),
                                            ).center(),
                                          ),
                                      debounce: true);
                                },
                              ).center())
                          .pad(0, 0, 0, 20)),
                ],
              ),
            )
          : const SizedBox(
              width: 0,
              height: 0,
            );
    }
  }
}

class DialogIcon extends StatelessWidget {
  final Widget? iconWidget;
  final String? asset;
  final double? iconSize;

  const DialogIcon({this.iconWidget, this.asset, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return iconWidget != null
        ? iconWidget!
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              asset != null
                  ? SvgPicture.asset(
                      asset!,
                      width: iconSize ?? 44,
                      height: iconSize ?? 44,
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
            ],
          );
  }
}

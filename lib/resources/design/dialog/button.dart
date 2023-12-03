import '../../../ui.dart';

class DialogButton extends StatelessWidget {
  final Function() onTap;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final Color? color;
  final String title;
  final Widget? customTitle;

  const DialogButton(
      {super.key,
      required this.onTap,
      this.height,
      this.width,
      this.decoration,
      this.color,
      required this.title,
      this.customTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: (customTitle ?? title.bold())
            .container()
            .height(40)
            .constraints(BoxConstraints(
              maxWidth: width ?? double.infinity,
            ))
            .color(color ?? ColorKit.primary1)
            .b()
            .center());
  }
}

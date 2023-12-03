import '../ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double elevation;
  final PreferredSizeWidget? bottom;
  final BuildContext context;
  final List<Widget>? actions;
  final VoidCallback? onLeadingPressed;
  final Widget? leading;
  final bool? centerTitle;
  final Widget? customTitle;
  final Color? backgroundColor;
  final double? leadingWidth;
  final Color? iconColor;
  final Color? titleColor;
  final bool? hideLeading;

  const CustomAppBar._(
      {Key? key,
      this.title,
      this.elevation = 0.0,
      this.actions,
      this.titleColor,
      this.bottom,
      this.onLeadingPressed,
      this.leading,
      this.customTitle,
      this.centerTitle,
      this.backgroundColor,
      this.leadingWidth,
      this.iconColor,
      required this.context,
      this.hideLeading})
      : super(key: key);

  factory CustomAppBar.customTitleLight(BuildContext context,
          {Widget? customTitle, bool? centerTitle, bool? hideLeading, Color? iconColor}) =>
      CustomAppBar._(
        backgroundColor: Colors.transparent,
        context: context,
        customTitle: customTitle,
        titleColor: ColorKit.black4,
        iconColor: iconColor ?? ColorKit.black4,
        centerTitle: centerTitle,
        hideLeading: hideLeading,
      );

  factory CustomAppBar.simpleLight(BuildContext context,
          {String? title, bool? centerTitle, bool? hideLeading, Color? iconColor}) =>
      CustomAppBar._(
        backgroundColor: Colors.transparent,
        context: context,
        title: title,
        titleColor: ColorKit.black4,
        iconColor: iconColor ?? ColorKit.black4,
        centerTitle: centerTitle,
        hideLeading: hideLeading,
      );

  factory CustomAppBar.simplePrimary(BuildContext context, {String? title, bool? centerTitle, bool? hideLeading}) =>
      CustomAppBar._(
        backgroundColor: ColorKit.primary1,
        context: context,
        title: title,
        titleColor: ColorKit.white1,
        iconColor: ColorKit.white1,
        centerTitle: centerTitle,
        hideLeading: hideLeading,
      );

  factory CustomAppBar.primaryWithActions(BuildContext context,
          {List<Widget>? actions, String? title, bool? centerTitle, bool? hideLeading, Widget? leading}) =>
      CustomAppBar._(
          backgroundColor: ColorKit.primary1,
          context: context,
          title: title,
          titleColor: ColorKit.white1,
          iconColor: ColorKit.white1,
          actions: actions,
          centerTitle: centerTitle,
          hideLeading: hideLeading,
          leading: leading);

  factory CustomAppBar.lightWithActions(BuildContext context,
          {List<Widget>? actions, String? title, bool? centerTitle, bool? hideLeading}) =>
      CustomAppBar._(
        backgroundColor: ColorKit.white1,
        context: context,
        title: title,
        titleColor: ColorKit.black4,
        iconColor: ColorKit.black4,
        actions: actions,
        centerTitle: centerTitle,
        hideLeading: hideLeading,
      );

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'appbar',
        child: Material(
            color: Colors.transparent,
            child: AppBar(
              backgroundColor: backgroundColor,
              titleSpacing: 20,
              elevation: elevation,
              automaticallyImplyLeading: !(hideLeading ?? false),
              leading: (hideLeading ?? false)
                  ? null
                  : IconButton(
                      onPressed: () {
                        if (onLeadingPressed != null) {
                          onLeadingPressed?.call();
                          return;
                        }
                        Navigator.of(context).pop();
                      },
                      icon: leading ?? Assets.svg.icArrowBack.svg(color: iconColor),
                    ),
              leadingWidth: leadingWidth,
              bottom: bottom,
              title: customTitle ?? title?.h2(),
              centerTitle: centerTitle,
              actions: actions,
            )));
  }

  double height(BuildContext context) => dimens.height;

  AppBarDimensions get dimens => Dimens.appBar(context);

  @override
  Size get preferredSize => Size.fromHeight(height(context));
}

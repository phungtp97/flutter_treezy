import 'package:flutter/material.dart';

class FadeBottomToTopPageRoute<T> extends PageRoute<T> {
  FadeBottomToTopPageRoute({required this.builder, RouteSettings? settings}) : super(settings: settings);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 400);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final Widget page = builder(context);
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Interval(0.5, 1.0, curve: Curves.easeInQuint),
      )),
      child: SizeTransition(
        sizeFactor: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
        )),
        axis: Axis.vertical,
        child: page,
      ),
    );
  }

  @override
  Color? get barrierColor => Colors.white;
}

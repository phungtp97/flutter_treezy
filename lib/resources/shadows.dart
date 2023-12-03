import 'package:flutter/material.dart';
import '../ui.dart';

class Shadows {
  static BoxShadow commonShadow({
    Color? color,
    double? blurRadius,
    Offset? offset,
  }) {
    return BoxShadow(
      color: color ?? ColorKit.black3,
      blurRadius: blurRadius ?? 8,
      offset: offset ?? const Offset(0, 2),
    );
  }

  static BoxShadow shadowBottom1() {
    return BoxShadow(
      color: ColorKit.black4.withOpacity(0.14),
      blurRadius: 7,
      spreadRadius: 0,
      offset: const Offset(0, 3),
    );
  }
  
  static BoxShadow shadowBottom2() {
    return BoxShadow(
      color: ColorKit.black4.withOpacity(0.06),
      blurRadius: 10,
      spreadRadius: 0,
      offset: const Offset(0, 3),
    );
  }

  static BoxShadow shadowBottom3() {
    return BoxShadow(
      color: ColorKit.black4.withOpacity(0.12),
      blurRadius: 14,
      spreadRadius: 0,
      offset: const Offset(0, 6),
    );
  }

  static BoxShadow shadowBottom4() {
    return BoxShadow(
      color: ColorKit.black4.withOpacity(0.12),
      blurRadius: 30,
      spreadRadius: 0,
      offset: const Offset(0, 4),
    );
  }

  static BoxShadow shadowTop1() {
    return BoxShadow(
      color: ColorKit.black4.withOpacity(0.12),
      blurRadius: 14,
      spreadRadius: 0,
      offset: const Offset(0, -4),
    );
  }

  static BoxShadow shadowTop2() {
    return BoxShadow(
      color: ColorKit.black4.withOpacity(0.12),
      blurRadius: 16,
      spreadRadius: 0,
      offset: const Offset(0, -4),
    );
  }
}

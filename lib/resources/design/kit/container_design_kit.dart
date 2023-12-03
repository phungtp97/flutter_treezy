import '../../../enums/enums.dart';
import '../../../ui.dart';
import '../base/base_design_data.dart';

class ContainerDesignData extends BaseDesignData {
  Widget? child;
  BorderRadiusEnum? borderRadius;
  Radius? radius;
  Color? color;
  Clip? clip;
  EdgeInsets? padding;
  EdgeInsets? margin;
  double? width;
  double? height;
  BoxConstraints? constraints;

  ContainerDesignData(
      {this.child,
      this.borderRadius,
      this.radius,
      this.color,
      this.clip,
      this.padding,
      this.margin,
      this.width,
      this.constraints,
      this.height});

  ContainerDesignData copy(ContainerDesignData data) {
    return ContainerDesignData(
        child: data.child ?? child,
        color: data.color ?? color,
        borderRadius: data.borderRadius ?? borderRadius,
        width: data.width ?? width,
        height: data.height ?? height,
        margin: data.margin ?? margin,
        radius: data.radius ?? radius,
        constraints: data.constraints ?? constraints,
        clip: data.clip ?? clip,
        padding: data.padding ?? padding);
  }
}

class ContainerDesignKit extends BaseDesignKit<Container, ContainerDesignData> {
  late ContainerDesignData _data;

  ContainerDesignKit({Widget? child}) {
    _data = ContainerDesignData(child: child);
  }

  @override
  Container buildWidget() {
    return Container(
      clipBehavior: _data.clip ?? Clip.hardEdge,
      padding: _data.padding,
      margin: _data.margin,
      height: _data.height,
      width: _data.width,
      decoration: BoxDecoration(
        color: _data.color,
        borderRadius: _buildBorderRadius(),
      ),
      child: _data.child,
    );
  }

  BorderRadius _buildBorderRadius() {
    BorderRadiusEnum borderRadiusEnum = (_data.borderRadius ?? Dimens.borderRadiusEnum);
    final radius = _data.radius ?? Radius.zero;
    switch (borderRadiusEnum) {
      case BorderRadiusEnum.all:
        return BorderRadius.all(radius);
      case BorderRadiusEnum.bottom:
        return BorderRadius.only(bottomLeft: radius, bottomRight: radius);
      case BorderRadiusEnum.top:
        return BorderRadius.only(topRight: radius, topLeft: radius);
      case BorderRadiusEnum.left:
        return BorderRadius.only(topLeft: radius, bottomLeft: radius);
      case BorderRadiusEnum.right:
        return BorderRadius.only(topRight: radius, bottomRight: radius);
      case BorderRadiusEnum.bottomLeft:
        return BorderRadius.only(bottomLeft: radius);
      case BorderRadiusEnum.bottomRight:
        return BorderRadius.only(bottomRight: radius);
      case BorderRadiusEnum.topLeft:
        return BorderRadius.only(topLeft: radius);
      case BorderRadiusEnum.topRight:
        return BorderRadius.only(topRight: radius);
    }
  }

  ContainerDesignKit height(double value) {
    _data.height = value;
    return this;
  }

  ContainerDesignKit width(double value) {
    _data.width = value;
    return this;
  }

  ContainerDesignKit color(Color value) {
    _data.color = value;
    return this;
  }

  ContainerDesignKit padding10() {
    _data.padding = const EdgeInsets.all(10);
    return this;
  }

  ContainerDesignKit margin10() {
    _data.margin = const EdgeInsets.all(10);
    return this;
  }

  ContainerDesignKit radius(Radius radius) {
    _data.radius = radius;
    return this;
  }

  ContainerDesignKit get radiusDef {
    _data.radius = Radius.zero;
    return this;
  }

  ContainerDesignKit borderRadius(BorderRadius radius) {
    _data.borderRadius = Dimens.borderRadiusEnum;
    return this;
  }

  ContainerDesignKit get borderRadiusDef {
    _data.borderRadius = BorderRadiusEnum.all;
    return this;
  }

  ContainerDesignKit constraints(BoxConstraints value) {
    _data.constraints = value;
    return this;
  }

  ContainerDesignKit clipWith(Clip value) {
    _data.clip = value;
    return this;
  }

  ContainerDesignKit get clipDef {
    _data.clip = Clip.hardEdge;
    return this;
  }

  ContainerDesignKit copy(ContainerDesignData? data) {
    if (data != null) {
      _data = _data.copy(data);
    }
    return this;
  }
}

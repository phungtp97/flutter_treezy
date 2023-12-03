import '../../../ui.dart';

extension DesignKitExt on Widget {
  ContainerDesignKit container() => ContainerDesignKit(child: this);
  ContainerDesignKit color(Color color) => ContainerDesignKit(child: this).color(color);
}

extension TextKitExt on String {
  TextDesignKit get text => TextDesignKit(this);
  Text h1({TextDesignData? data}) => TextDesignKit(this).fSize(24).color(ColorKit.black5).weight(FontWeight.w700).copy(data).b() as Text;
  Text h2({TextDesignData? data}) => TextDesignKit(this).fSize(18).color(ColorKit.black5).weight(FontWeight.w700).copy(data).b() as Text;
  Text h3({TextDesignData? data}) => TextDesignKit(this).fSize(16).color(ColorKit.black5).weight(FontWeight.w600).copy(data).b() as Text;
  Text textXS({TextDesignData? data}) => TextDesignKit(this).fSize(10).color(ColorKit.black5).weight(FontWeight.w500).copy(data).b() as Text;
  Text textS({TextDesignData? data}) => TextDesignKit(this).fSize(12).color(ColorKit.black5).weight(FontWeight.w500).copy(data).b() as Text;
  Text textM({TextDesignData? data}) => TextDesignKit(this).fSize(14).color(ColorKit.black5).weight(FontWeight.w500).copy(data).b() as Text;
  Text textL({TextDesignData? data}) => TextDesignKit(this).fSize(16).color(ColorKit.black5).weight(FontWeight.w500).copy(data).b() as Text;
  Text bold({TextDesignData? data}) => TextDesignKit(this).bold().b() as Text;
}

extension DesignBuilderExt on BaseDesignKit {
  Widget b() => buildWidget();
}
import '../../../ui.dart';
import '../base/base_design_data.dart';

class TextDesignData extends BaseDesignData {
  String? text;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  Color? color;
  Color? fillColor;
  FontStyle? fontStyle;
  double? fontSize;
  int? maxLines;
  double? height;

  TextDesignData(
      {this.text, this.fontWeight, this.textAlign, this.color, this.fillColor, this.fontStyle, this.fontSize});

  TextDesignData copy(TextDesignData data) {
    return TextDesignData(
        text: data.text ?? text,
        fontStyle: data.fontStyle ?? fontStyle,
        fontSize: data.fontSize ?? fontSize,
        color: data.color ?? color,
        fontWeight: data.fontWeight ?? fontWeight,
        fillColor: data.fillColor ?? fillColor,
        textAlign: data.textAlign ?? textAlign);
  }
}

class TextDesignKit extends BaseDesignKit<Text, TextDesignData> {
  late TextDesignData _data;

  TextDesignKit(String text) {
    _data = TextDesignData(
        text: text,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.start,
        color: Colors.black,
        fillColor: Colors.transparent,
        fontSize: 14,
        fontStyle: FontStyle.normal);
  }

  @override
  Text buildWidget() {
    if (_data.text == null) throw Exception('Text has no value');
    return Text(
      _data.text!,
      style: TextStyle(
          color: _data.color,
          backgroundColor: _data.fillColor,
          fontSize: _data.fontSize,
          fontWeight: _data.fontWeight,
          height: _data.height,
          fontStyle: _data.fontStyle),
      textAlign: _data.textAlign,
      maxLines: _data.maxLines,
    );
  }

  TextDesignKit height(double value) {
    _data.height = value;
    return this;
  }

  TextDesignKit weight(FontWeight value) {
    _data.fontWeight = value;
    return this;
  }

  TextDesignKit bold() => weight(FontWeight.w700);

  TextDesignKit light() => weight(FontWeight.w300);

  TextDesignKit extraBold() => weight(FontWeight.w900);

  TextDesignKit align(TextAlign value) {
    _data.textAlign = value;
    return this;
  }

  TextDesignKit color(Color value) {
    _data.color = value;
    return this;
  }

  TextDesignKit fillColor(Color value) {
    _data.fillColor = value;
    return this;
  }

  TextDesignKit fStl(FontStyle value) {
    _data.fontStyle = value;
    return this;
  }

  TextDesignKit fSize(double value) {
    _data.fontSize = value;
    return this;
  }

  TextDesignKit lines(int? value) {
    _data.maxLines = value;
    return this;
  }

  TextDesignKit center() {
    _data.textAlign = TextAlign.center;
    return this;
  }

  TextDesignKit copyStyle(TextStyle? style) {
    if(style != null) {
      TextDesignData data = TextDesignData(
          fontWeight: style.fontWeight, fontSize: style.fontSize, fontStyle: style.fontStyle, color: style.color);
      _data = _data.copy(data);
    }
    return this;
  }

  TextDesignKit copy(TextDesignData? data) {
    if (data != null) {
      _data = _data.copy(data);
    }
    return this;
  }
}

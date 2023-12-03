import 'package:flutter/material.dart';
import 'base_design_data.dart';

abstract class BaseDesignKit<T extends Widget, B extends BaseDesignData> {
  T buildWidget();
}
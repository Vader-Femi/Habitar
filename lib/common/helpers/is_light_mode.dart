import 'package:flutter/material.dart';

extension LightMode on BuildContext {

  bool get isLightMode {
    return Theme.of(this).brightness == Brightness.light;
  }
}
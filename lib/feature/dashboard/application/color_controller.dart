import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/core/utils/app_color_value.dart';

/// provider for accessing [ColorController]
final colorProvider = StateNotifierProvider<ColorController, Color>((ref) {
  return ColorController();
});

///
class ColorController extends StateNotifier<Color> {
  ///
  ColorController() : super(const Color(AppColorValue.defaultColor));

  /// generate random color
  void generateColor() {
    final colorValue =
        (math.Random().nextDouble() * AppColorValue.defaultColor).toInt();
    state = Color(colorValue).withOpacity(1.0);
  }

  ///reset color
  void setDefaultColor() {
    state = const Color(AppColorValue.defaultColor);
  }
}

import 'package:flutter/material.dart';

/// Removes the material glow behaviour that is default for
/// overscroll on Android
class ScrollWithoutMaterialOverflowGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

import 'package:flutter/material.dart';
import 'package:tool_kit/src/transforms/click_transform.dart';

extension TransformExtensions on Widget {
  Widget get pushEffectOnClick => TranslateOnClick(child: this);
}
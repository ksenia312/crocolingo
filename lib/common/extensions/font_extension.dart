import 'package:crocolingo/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

extension FamilyExtension on TextStyle {
  TextStyle lato() {
    return copyWith(fontFamily: FontFamily.lato);
  }
}

final simpleLatoStyle = const TextStyle().lato();

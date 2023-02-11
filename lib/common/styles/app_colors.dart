import 'package:flutter/material.dart';

enum ShadeTypes {
  negative10,
  positive10,
}

class AppColors {
  static const Color brand = Color(0xFF5F60B9);

  static const Color fill = Color(0xFFF2F3F7);

  static Color brandShades(ShadeTypes shadeTypes) {
    switch (shadeTypes) {
      case ShadeTypes.negative10:
        return const Color(0xFF5F61C8);
      case ShadeTypes.positive10:
        return const Color(0xFF8888C1);
      default:
        return brand;
    }
  }

  static const Color backgroundColor = Color(0xFFEFF3F6);

  static const Color black = Color(0xFF131313);

  static const Color white = Color(0xFFFFFFFF);

  static const Color grey = Color(0xFFAAAAAA);

  static const borderColor = Color(0xFFEFF3F6);

  static Color greyShades(ShadeTypes shadeTypes) {
    switch (shadeTypes) {
      case ShadeTypes.negative10:
        return const Color(0xFFB6BEC4);
      case ShadeTypes.positive10:
        return const Color(0xFFA09B9B);
      default:
        return grey;
    }
  }
}

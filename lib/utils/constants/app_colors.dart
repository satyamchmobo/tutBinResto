import 'package:flutter/material.dart';

class AppColors extends MaterialColor {
  const AppColors(int primary, Map<int, Color> swatch) : super(primary, swatch);

  static const int primaryColorValueOrange = 0xFFFF8403;

  static const primaryWhite = Color(0xFFFFFFFF);

  static const primaryOrange = Color(0xFFFF8403);

  static const MaterialColor primaryColorSwatchOrange =
      MaterialColor(primaryColorValueOrange, <int, Color>{
    50: Color(primaryColorValueOrange),
    100: Color(primaryColorValueOrange),
    200: Color(primaryColorValueOrange),
    300: Color(primaryColorValueOrange),
    400: Color(primaryColorValueOrange),
    500: Color(primaryColorValueOrange),
    600: Color(primaryColorValueOrange),
    700: Color(primaryColorValueOrange),
    800: Color(primaryColorValueOrange),
    900: Color(primaryColorValueOrange),
  });
}


// MaterialColor orangeColorCustom = MaterialColor(0xFFFF8403, primaryColorSwatch);
class ColorConstants {
  static Color lightBackgroundColor = hexToColor('#F7F7FC');
  static Color primaryColor = hexToColor("#00A8E8");
  static Color storyHighlightColor = hexToColor("#F8C371");
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}

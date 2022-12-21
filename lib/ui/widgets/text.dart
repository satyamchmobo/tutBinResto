import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget text(
    {required String text,
    TextDecoration? decoration,
    required Color color,
    FontWeight? fontWeight,
    TextStyle? textStyle,
    required double fontSize,  style}) {
  return Text(
    text,
    style: GoogleFonts.montserrat(
      
        decoration: decoration,
        textStyle: textStyle,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight),
  );
}

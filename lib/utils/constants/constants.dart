import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  static const String baseImage = 'assets/images/';

  static TextStyle getTextStyle({
    required FontWeight fontWeight,
    required double fontSize,
    required double letterSpacing,
    required double height,
    required Color color,
  }) {
    return GoogleFonts.cairo(
      fontWeight: fontWeight,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      height: height,
      color: color,
    );
  }
}
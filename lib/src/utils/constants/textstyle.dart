import 'package:cnt_mobile/src/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle selectedLabelStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontFamily: GoogleFonts.archivo().fontFamily,
  );

  static TextStyle unselectedLabelStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontFamily: GoogleFonts.archivo().fontFamily,
  );

  static TextStyle appBarStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.brown100,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
}

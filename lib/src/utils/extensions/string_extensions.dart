import 'package:cnt_mobile/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension StyledTextExtension on String {
  Text textStyled({
    double? fontSize,
    Color? color = AppColors.black,
    FontWeight? fontWeight,
    String? fontFamily,
    FontStyle? fontStyle,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
    TextAlign? textAlign,
    double? wordSpacing,
    double? letterSpacing,
    int? maxLines,
    bool? softWrap,
  }) {
    return Text(
      this,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      softWrap: softWrap,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontFamily: fontFamily ?? GoogleFonts.archivo().fontFamily,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: textDecoration,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        color: color,
      ),
    );
  }
}

extension StyledButtonTextExtension on String {
  Text buttonStyled({
    double? fontSize,
    Color? color = AppColors.white,
    FontWeight? fontWeight,
    String? fontFamily,
    FontStyle? fontStyle,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
    TextAlign? textAlign,
    double? wordSpacing,
    double? letterSpacing,
    int? maxLines,
    bool? softWrap,
  }) {
    return Text(
      this,
      overflow: textOverflow ?? TextOverflow.clip,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      softWrap: softWrap,
      style: TextStyle(
        fontSize: fontSize ?? 12,
        fontFamily: fontFamily ?? GoogleFonts.alegreya().fontFamily,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: textDecoration,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        color: color,
      ),
    );
  }
}

extension StyledPodkovaTextExtension on String {
  Text podkovaStyled({
    double? fontSize,
    Color? color = AppColors.black,
    FontWeight? fontWeight,
    String? fontFamily,
    FontStyle? fontStyle,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
    TextAlign? textAlign,
    double? wordSpacing,
    double? letterSpacing,
    int? maxLines,
    double? height,
  }) {
    return Text(
      this,
      overflow: textOverflow ?? TextOverflow.clip,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      style: TextStyle(
          fontSize: fontSize ?? 16,
          fontFamily: fontFamily ?? GoogleFonts.podkova().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          decoration: textDecoration,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          color: color,
          height: height),
    );
  }
}

extension StyledInterTextExtension on String {
  Text interStyled({
    double? fontSize,
    Color? color = AppColors.black,
    FontWeight? fontWeight,
    String? fontFamily,
    FontStyle? fontStyle,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
    TextAlign? textAlign,
    double? wordSpacing,
    double? letterSpacing,
    int? maxLines,
    double? height,
  }) {
    return Text(
      this,
      overflow: textOverflow ?? TextOverflow.clip,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      style: TextStyle(
          fontSize: fontSize ?? 16,
          fontFamily: fontFamily ?? GoogleFonts.inter().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          decoration: textDecoration,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          color: color,
          height: height),
    );
  }
}

extension BoolExtension on String {
  // bool get isEmail => EmailValidator.validate(this);

  bool get isPin {
    if (isEmpty) {
      return false;
    } else if (length != 6) {
      return false;
    } else if (!RegExp(r'^-?[0-9]+$').hasMatch(this)) {
      return false;
    }
    return true;
  }

  bool get isSetPin {
    if (isEmpty) {
      return false;
    } else if (length != 4) {
      return false;
    } else if (!RegExp(r'^-?[0-9]+$').hasMatch(this)) {
      return false;
    }
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_colors.dart';

TextStyle textHeaderStyle({
  color = MyColors.headerTextColor,
  double fontSize = 24,
  fontWeight = FontWeight.w700,
  isColorWhite = false,
  bool isColorPrimary = false,
  double? lineHeight,
}) {
  return GoogleFonts.hindSiliguri(
      fontSize: fontSize.sp,
      color: isColorWhite
          ? MyColors.white
          : isColorPrimary
          ? MyColors.primary
          : color,
      fontWeight: fontWeight,
      height: lineHeight);
}

TextStyle textAppBarStyle({
  color = MyColors.appBarTextColor,
  double fontSize = 16,
  fontWeight = FontWeight.w600,
  bool isGrayColor = false,
}) {
  return GoogleFonts.hindSiliguri(
    fontSize: fontSize.sp,
    color: isGrayColor ? MyColors.gray : color,
    fontWeight: fontWeight,
  );
}

TextStyle textRegularStyle({
  color = MyColors.black,
  double fontSize = 14,
  fontWeight = FontWeight.normal,
  bool isColorPrimary = false,
  bool isColorWhite = false,
  bool isTextColor = false,
  double? lineHeight,
}) {
  return GoogleFonts.hindSiliguri(
    fontSize: fontSize.sp,
    color: isTextColor
        ? MyColors.textColor
        : isColorWhite
        ? MyColors.white
        : isColorPrimary
        ? MyColors.primary
        : color,
    fontWeight: fontWeight,
    height: lineHeight,
  );
}

TextStyle textButtonStyle({
  color = MyColors.white,
  double fontSize = 18,
  fontWeight = FontWeight.w600,
}) {
  return GoogleFonts.hindSiliguri(
    fontSize: fontSize.sp,
    color: color,
    fontWeight: fontWeight,
  );
}

final hintStyle = GoogleFonts.hindSiliguri(
  fontSize: 14.sp,
  color: MyColors.inputColor,
  fontWeight: FontWeight.w500,
);

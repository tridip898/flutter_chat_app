import 'package:flutter/material.dart';

class MyColors {
  static const int _primaryColorValue = 0xff263238;
  static const MaterialColor colorPrimarySwatch = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xffa0cfe7),
      100: Color(0xff79a3b7),
      200: Color(0xff5c7a88),
      300: Color(0xff597381),
      400: Color(0xff4b636e),
      500: Color(_primaryColorValue),
      600: Color(0xff40545e),
      700: Color(0xff3b4d56),
      800: Color(0xff2a3941),
      900: Color(0xff263238),
    },
  );
  static const transparent = Colors.transparent;
  static const primary = Color(0xff263238);
  static const white = Color(0xffffffff);

  static const darkPurple = Color(0xFF12101F);

  static const purple = Color(0xFF5C3BFF);
  static const black = Color(0xFF091C32);
  static const blackPure = Color(0xFF000000);
  static const gray = Color(0xFF52596E);
  static const liteGray = Color(0xFFD9D9D9);
  static const liteGrayStepLine = Color(0xFF8FAABB);
  static const liteStepLine = Color(0xFFE2F0FD);
  static const inputColor = Color(0x8052596E); //alpha 50%
  static const wrong = Color(0xFFC20707);
  static const green = Color(0xFF34A853);
  static const liteGreen = Color(0xFF56C674);
  static const red = Color(0xFFFF1F00);
  static const darkRed = Color(0xFF4A154B);
  static const orangeLite = Color(0xFFFE914E);
  static const activeSwitch = Color(0xFF08ABB3);

  static const headerTextColor = Color(0xFF172B4D);
  static const appBarTextColor = Color(0xFF000000);
  static const underlineColor = Color(0xFFCCCCCC);
  static const textColorBlue = Color(0xFF2E38B6);
  static const fieldColor = Color(0xFF846AE3);
  static const textColor = Color(0xFF8C8385);
  static const questionListBackgroundColor = Color(0xFFF2F7F6);

  static const listBackgroundColor = Color(0xFFF7F7F7);
  static const listStrokeColor = Color(0xFFDDDDDD);

  /// [pie chart] color
  static const problemSolvingColor = Color(0xff9779FF);
  static const analyticalThinkingColor = Color(0xff7B60FF);
  static const communicationSkillsColor = Color(0xff5C3BFF);

  static const gradientLeftColor = Color(0xB8240DFF);
  static const gradientRightColor = Color(0xFF6B4BDA);

  static const shimmerBaseColor = Color(0xFFD9D9D9);
  static const shimmerHighlightColor = Color(0xFFF6F6F6);

  static const buttonBlack = Color(0xff353237);
  static const likeWhite = Color(0xffEEEEEE);
  static const grey = Color(0xFF52596E);

  static const infoColor = Color(0xFF33b5e5);
  static const successColor = Color(0xFF00C851);
  static const errorColor = Color(0xFFff4444);

  static const borderGrayColor = Color(0xFFBCBCBC);

  // Gradient
  static const baseGradient = LinearGradient(
    colors: [
      gradientLeftColor,
      gradientRightColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

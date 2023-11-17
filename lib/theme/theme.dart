import 'package:flutter/material.dart';

const kColorPrimary = Color(0xFF0A0A0A);
const kColorPrimarySecond = Color(0xFF464749);
const kColorLightGrey = Color(0xFFADADAD);
const kColorGreyShadow = Color(0x62ADADAD);
const kColorLightGray = Color(0xFFF5F5F5);
const kColorGrayIcon = Color(0xFF666666);

class PrimaryFont {
  static const String fontFamily = "SanFrancisco";
  static TextStyle light(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: size,
    );
  }

  static TextStyle regular(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: size,
    );
  }

  static TextStyle medium(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: size,
    );
  }

  static TextStyle semiBold(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: size,
    );
  }

  static TextStyle bold(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: size,
    );
  }
}

import 'package:flutter/material.dart';

class AppStyle {
  /// LIGHT
  static TextStyle light({required double fontSize, required Color color,}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: color ,
    );
  }

  /// REGULAR
  static TextStyle regular({required double fontSize , required Color color,}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color ,
    );
  }

  /// MEDIUM
  static TextStyle medium({required double fontSize  , required Color color,}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color ,
    );
  }

  /// SEMI BOLD
  static TextStyle semiBold({required double fontSize , required Color color,}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  /// BOLD
  static TextStyle bold({required double fontSize , required Color color,}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w900,
      color: color,
    );
  }
}

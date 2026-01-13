import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFFCF610E);
  static const Color secondary = Color(0xFFF1700E);
  static const Color bgcolor=Color(0xFFFFFFFF);
  static const Color fadetextcolor=Color(0xFF737272);
  static const Color fadecolor=Color(0xFFECE5E5);
  static const Color textcolor=Color(0xff262626);
  static const Color cardbg=Color(0xFFFDEEE2);
  static const Color boder=Color(0xFFD9D9D9);
  static const Color cardboder=Color(0xffD9D9D9);
  static const LinearGradient bgGradient =   LinearGradient(colors: [Color(0xffE6E5E5), Color(0xffFDEEE2)], begin: Alignment.topCenter, end: Alignment.bottomCenter);
 static const LinearGradient AppbarGradient =   LinearGradient(colors: [AppColor.primary, AppColor.secondary], begin: Alignment.bottomCenter, end: Alignment.topCenter);
 static const LinearGradient DashboardGradient =   LinearGradient(colors: [   Color(0xFFFDEEE2), Color(0xFFBFE5F3),]);
 static const LinearGradient ProductCardGradient =   LinearGradient(colors: [ Color(0xffFDEEE2),Color(0xFFFFFFFF), ],begin: Alignment.topRight, end: Alignment.bottomLeft,);
 static const LinearGradient OnboardGradient =   LinearGradient(colors: [  Color(0xFFFAE1CE),Color(0xFFFAC59F) ,],begin: Alignment.topCenter, end: Alignment.bottomCenter,);
 static const LinearGradient ActionButtonGradient =   LinearGradient(colors: [  Color(0xFFF8B582),Color(0xFFF27B21) ,],begin: Alignment.topRight, end: Alignment.bottomLeft,);

}

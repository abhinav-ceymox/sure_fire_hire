import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sure_fire_hire/views/onboard_Screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String route = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds:1), () {
      context.pushNamed(OnboardScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/icons/Group 4.svg',width: 100,height: 100,),

      ),
    );
  }
}

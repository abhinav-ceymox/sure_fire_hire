import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sure_fire_hire/utilities/app_color.dart';
import 'package:sure_fire_hire/views/home.dart';

import '../widgets/button.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});
  static const String route = '/OnboardScreen';
  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: AppColor.bgcolor,
              child: Column(
                children: [
                  const SizedBox(height: 65),
                  SvgPicture.asset(
                    'assets/icons/Group 4.svg',
                    height: 70,
                    width: 70,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                // Background image
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Group 306.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.white.withOpacity(0.0), // top clear
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.65),
                        Colors.white, // bottom full white
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFAE1CE), Color(0xFFFAC59F)],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Vendor',
                    style: TextStyle(
                      color: AppColor.secondary,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Turn your tools into profit',
                    style: TextStyle(
                      color: AppColor.textcolor,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'start selling today!',
                    style: TextStyle(
                      color: AppColor.textcolor,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Surefire Hire is the place for you, you can list your',
                    style: TextStyle(
                      color: AppColor.textcolor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'tools/equipment  and earn a passive income',
                    style: TextStyle(
                      color: AppColor.textcolor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Button(
                    text: 'Get Started',
                    onPressed: () {
                      context.pushNamed(SellerDashboardScreen.route);
                    },
                    height: 52,
                    width: 182,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

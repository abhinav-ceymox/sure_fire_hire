import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utilities/app_color.dart';

class ManageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final bool message;

  const ManageCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.message = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffA5A4A4), width: 1),
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xffe4e2e2), Color(0xffFFFFFF)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
       child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Image.asset(image, width: 80, height: 80),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColor.textcolor,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColor.textcolor, fontSize: 16),
                ),
                const SizedBox(height: 20),

                /// BUTTONS
                Row(
                  children: [
                    Expanded(
                      child: _button(
                        'assets/icons/preference-horizontal.svg',
                        "Sort",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _button('assets/icons/sorting-05.svg', "Filter"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (message) ...[
            Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xffA5A4A4),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.bgcolor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              alignment: Alignment.center,
              child: Text(
                'You have 2 orders',
                style: TextStyle(
                  color: AppColor.secondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

Widget _button(String svgPath, String text) {
  return Container(
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xffA5A4A4)),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(svgPath, height: 20, width: 20),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            color: AppColor.textcolor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

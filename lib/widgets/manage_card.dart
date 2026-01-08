
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utilities/app_color.dart';

class ManageCard extends StatelessWidget {
  const ManageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(28),
      padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          border: Border.all(color:Color(0xffA5A4A4), width: 1,),
          borderRadius: BorderRadius.circular(28), // 30 - 7
          gradient: const LinearGradient(
            colors: [
              Color(0xffFFFFFF),
              Color(0xffF0F0F0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            Image.asset('assets/images/Group 309.png', width: 80, height: 80),
            const SizedBox(height: 10),
            Text(
              'Manage Products',
              style: TextStyle(
                color: AppColor.textcolor,
                fontWeight: FontWeight.w800,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'You can view and edit products from here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.textcolor,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),

            /// BUTTONS
            Row(
              children: [
                Expanded(child: _button('assets/icons/preference-horizontal.svg', "Sort")),
                const SizedBox(width: 20),
                Expanded(child: _button('assets/icons/sorting-05.svg', "Filter")),
              ],
            ),
          ],
        ),
      );


  }
}
Widget _button(String svgPath, String text) {
  return Container(
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.boder),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(svgPath,height: 20,width: 20,),
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

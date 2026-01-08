import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utilities/app_color.dart';

class Normal_appbar extends StatelessWidget implements PreferredSizeWidget {
  const Normal_appbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.bgcolor,
      shape: const Border(
        bottom: BorderSide(width: 1.5, color: Color(0xFFA5A4A4)),
      ),
      leadingWidth: 60,
      leading: Center(
        child: SvgPicture.asset(
          'assets/icons/menu-02.svg',
          height: 30,
          width: 30,
          color: Colors.black,
        ),
      ),
      actions: [
        SvgPicture.asset(
          'assets/icons/notification-02.svg',
          height: 28,
          width: 28,
          color: Colors.black,
        ),
        const SizedBox(width: 12),
        SvgPicture.asset(
          'assets/icons/more-vertical-circle-01.svg',
          height: 28,
          width: 28,
          color: Colors.black,
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}

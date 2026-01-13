
import 'package:flutter/material.dart';

import '../utilities/app_color.dart';
import '../utilities/text_style.dart';

class SelectionTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final BorderRadius borderRadius;
  final VoidCallback onTap;

  const SelectionTab({
    super.key,
    required this.title,
    required this.isSelected,
    required this.borderRadius,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.secondary : AppColor.bgcolor,
            borderRadius: borderRadius,
            boxShadow: const [
              BoxShadow(
                color: Color(0x40000000), // 0px 0px 5px 0px #00000040
                blurRadius: 5,
                spreadRadius: 0,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: AppStyle.semiBold(
                fontSize: 16,
                color: isSelected
                    ? AppColor.bgcolor
                    : AppColor.textcolor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

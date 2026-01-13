import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sure_fire_hire/state/seller_provider.dart';
import 'package:sure_fire_hire/utilities/text_style.dart';
import '../utilities/app_color.dart';

class CustomCurvedSliverAppBar extends StatelessWidget {
  const CustomCurvedSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.watch<SellerProvider>().seller;
    return SliverAppBar(
      pinned: true,
       expandedHeight: 200,
      backgroundColor: AppColor.primary,
      automaticallyImplyLeading: false,
       title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/menu-02.svg',
                height: 28,
                width: 28,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(
                'assets/icons/Group 1.svg',
                height: 34,
                width: 34,
              ),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SurefireHire',
                    style: AppStyle.semiBold(
                      fontSize: 14,
                      color: AppColor.bgcolor,
                    ),
                  ),
                  Text(
                    'Equipment Rentals',
                    style: AppStyle.semiBold(
                      fontSize: 9,
                      color: AppColor.bgcolor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/notification-02.svg',
                height: 24,
                width: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 6),
              SvgPicture.asset(
                'assets/icons/more-vertical-circle-01.svg',
                height: 22,
                width: 22,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ],
      ),

       flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: AppColor.AppbarGradient,
              ),
            ),

            // Curved bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  color: AppColor.bgcolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${data.name}',
                      style: AppStyle.bold(
                        fontSize: 24,
                        color: AppColor.bgcolor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.role,
                      style: AppStyle.semiBold(
                        fontSize: 16,
                        color: AppColor.bgcolor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

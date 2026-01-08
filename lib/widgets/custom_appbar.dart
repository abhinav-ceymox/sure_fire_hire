import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sure_fire_hire/state/seller_provider.dart';
import '../utilities/app_color.dart';

class CustomCurvedAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomCurvedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider=context.watch<SellerProvider>();
    final data=provider.seller;
    return PreferredSize(
      preferredSize: const Size.fromHeight(200),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [AppColor.primary, AppColor.secondary],
          ),
        ),
        child: Stack(
          children: [
            // Curved bottom shape
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

            // Content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    // Top bar with menu, logo, notification, and more
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/menu-02.svg',
                          height: 35,
                          width: 30,
                        ),

                        // Logo
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(),
                              child: SvgPicture.asset(
                                'assets/icons/Group 1.svg',
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SurefireHire',
                                  style: TextStyle(
                                    color: AppColor.bgcolor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Equipment Rentals',
                                  style: TextStyle(
                                    color: AppColor.bgcolor,
                                    fontSize: 10,
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
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/icons/more-vertical-circle-01.svg',
                              height: 28,
                              width: 28,
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // User greeting
                    Text( 'Hi, ${data.name}',
                      style: const TextStyle(
                        color: AppColor.bgcolor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      data.role,
                      style: const TextStyle(
                        color: AppColor.bgcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
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

  @override
  Size get preferredSize => const Size.fromHeight(200);
}

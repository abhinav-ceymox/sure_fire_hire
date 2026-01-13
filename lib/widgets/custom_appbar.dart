import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sure_fire_hire/state/seller_provider.dart';
import 'package:sure_fire_hire/utilities/text_style.dart';
import '../utilities/app_color.dart';

class CustomCurvedAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomCurvedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider=context.watch<SellerProvider>();
    final data=provider.seller;
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
        decoration:  BoxDecoration(
          gradient:AppColor.AppbarGradient,
        ),
        child: Stack(
          children: [

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

                        Row(
                           children: [
                             SvgPicture.asset(
                               'assets/icons/menu-02.svg',
                               height: 35,
                               width: 30,
                             ),
                            //logo
                             const SizedBox(width: 10,),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(),
                              child: SvgPicture.asset(
                                'assets/icons/Group 1.svg',
                                height: 40,
                                width: 40,
                              ),
                            ),
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SurefireHire',
                                  style: AppStyle.semiBold(fontSize: 18, color: AppColor.bgcolor),
                                ),
                                Text(
                                  'Equipment Rentals',
                                  style: AppStyle.semiBold(fontSize: 10, color: AppColor.bgcolor)
                                ),
                                Text(
                                    'affordaable-reliable-convenient',
                                    style: AppStyle.semiBold(fontSize: 6, color: AppColor.bgcolor)
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
  Size get preferredSize => const Size.fromHeight(70);
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sure_fire_hire/utilities/app_color.dart';
 import '../state/dashboard_provider.dart';

class DashboardStatsGrid  extends StatelessWidget {
   const DashboardStatsGrid ({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider >(builder: (BuildContext context, provider, Widget? child) {
      return GridView.builder(
        padding: EdgeInsets.all(5),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: provider.stats.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.5,

      ), itemBuilder: (context, index) {
          final stat=provider.stats[index];
          return Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(colors: [
                Color(0xFFFDEEE2),
                Color(0xFFBFE5F3),
              ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  stat.icon,
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                    AppColor.secondary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 15,),
                Text(
                  ('${stat.value}'),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondary,
                  ),
                ),
                 const SizedBox(height: 5,),
                 Text(stat.title,style:TextStyle(color: AppColor.fadetextcolor,fontSize: 14,fontWeight:FontWeight.bold),),
              ],

            ),
          );

      },);

    },);
  }


}

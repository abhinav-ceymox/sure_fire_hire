import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sure_fire_hire/state/seller_provider.dart';
import 'package:sure_fire_hire/utilities/app_color.dart';
import 'package:sure_fire_hire/utilities/text_style.dart';
import 'package:sure_fire_hire/widgets/dashboard_stats_grid.dart';
import 'package:sure_fire_hire/widgets/product_card.dart';
import '../state/dashboard_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/overview_bar_chart.dart';
import '../widgets/product_status_pie_chart.dart';

class SellerDashboardScreen extends StatefulWidget {
  const SellerDashboardScreen({super.key});

  static const String route = '/SellerDashboardScreen';

  @override
  State<SellerDashboardScreen> createState() => _SellerDashboardScreenState();
}

class _SellerDashboardScreenState extends State<SellerDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final sellerProvider = context.watch<SellerProvider>();
    final seller = sellerProvider.seller;

    return Scaffold(
      backgroundColor: AppColor.bgcolor,
       body: CustomScrollView(
        slivers: [
          const CustomCurvedSliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OverviewBarChart(),
                      const SizedBox(height: 20),

                      DashboardStatsGrid(),
                      const SizedBox(height: 20),

                      ProductStatusPieChart(),
                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "Top Selling products",
                          style: AppStyle.bold(
                            fontSize: 18,
                            color: AppColor.textcolor,
                          ),
                        ),
                      ),

                      Consumer<DashboardProvider>(
                        builder: (context, provider, _) {
                          return ProductCard(
                            products: provider.dashboardProducts,
                            direction: Axis.horizontal,
                          );
                        },
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

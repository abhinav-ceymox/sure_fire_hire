import 'package:flutter/material.dart';
import 'package:sure_fire_hire/utilities/app_color.dart';
import 'package:sure_fire_hire/widgets/dashboard_stats_grid.dart';
import 'package:sure_fire_hire/widgets/product_card.dart';
import '../widgets/app_bar.dart';
import '../widgets/overview_bar_chart.dart';
import '../widgets/product_status_pie_chart.dart';

class SellerDashboardScreen extends StatefulWidget {
  const SellerDashboardScreen({super.key});

  static const String route ='/SellerDashboardScreen';

  @override
  State<SellerDashboardScreen> createState() => _SellerDashboardScreenState();
}

class _SellerDashboardScreenState extends State<SellerDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      appBar: const CustomCurvedAppBar(),
      body: SingleChildScrollView(
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
                style: TextStyle(
                  color: AppColor.textcolor,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ),
            ProductCard(),
          ],
        ),
      ),
    );
  }
}

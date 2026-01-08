import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sure_fire_hire/utilities/app_color.dart';
import '../state/overview_provider.dart';
import '../models/product_status_model.dart';

class ProductStatusPieChart extends StatefulWidget {
  const ProductStatusPieChart({super.key});

  @override
  State<ProductStatusPieChart> createState() => _ProductStatusPieChartState();
}

class _ProductStatusPieChartState extends State<ProductStatusPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OverviewProvider>();
    final List<ProductStatus> data = provider.productStatusList;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.bgcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Product Status',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),

          _legendRow(data),
          const SizedBox(height: 20),

          SizedBox(
            height: 220,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 60,
                sectionsSpace: 4,

                 pieTouchData: PieTouchData(
                  touchCallback:
                      (FlTouchEvent event, PieTouchResponse? response) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          response == null ||
                          response.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          response.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),

                sections: _sections(data),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- PIE SECTIONS ----------------
  List<PieChartSectionData> _sections(List<ProductStatus> data) {
    return List.generate(data.length, (index) {
      final isTouched = index == touchedIndex;
      final item = data[index];

      return PieChartSectionData(
        value: item.count.toDouble(),
        color: item.color,
        radius: isTouched ? 50 : 40,

         title: isTouched ? '${item.count}' : '',
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      );
    });
  }

  // ---------------- LEGEND ----------------
  Widget _legendRow(List<ProductStatus> data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: data.map((item) {
        return Row(
          children: [
            Container(
              width: 30,
              height: 14,
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              item.label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

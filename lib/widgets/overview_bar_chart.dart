import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sure_fire_hire/utilities/app_color.dart';
import 'package:sure_fire_hire/utilities/text_style.dart';
import '../models/chart_model.dart';
import '../state/overview_provider.dart';
import '../utilities/chart_colors.dart';

class OverviewBarChart extends StatelessWidget {
  const OverviewBarChart({super.key});

  static const double _step = 10000;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OverviewProvider>();
    final List<MonthlyOverview> data = provider.monthlyOverview;

    final double maxValue = data
        .expand((e) => [e.income.toDouble(), e.expense.toDouble()])
        .reduce((a, b) => a > b ? a : b);

    final double maxY = _roundUp(maxValue, _step);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.bgcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _header(),
          const SizedBox(height: 24),
          SizedBox(
            height: 280,
            child: BarChart(
              BarChartData(
                maxY: maxY,
                groupsSpace: 20,
                barTouchData: _barTouchData(),
                gridData: _gridData(),
                titlesData: _titlesData(data),
                borderData: FlBorderData(show: false),
                barGroups: _barGroups(data),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          'Overview',
          style:AppStyle.bold(fontSize: 18, color: AppColor.textcolor) ,
        ),
        Row(
          children: [
            _legend(const Color(0xFF4EC6E0), 'Income'),
            const SizedBox(width: 16),
            _legend(const Color(0xFFFF8C42), 'Expense'),
          ],
        ),
      ],
    );
  }

  Widget _legend(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
         SizedBox(width: 6),
        Text(text,style: AppStyle.semiBold(fontSize: 14, color: AppColor.textcolor),),
      ],
    );
  }

  // ---------------- TOOLTIP ----------------
  BarTouchData _barTouchData() {
    return  BarTouchData(
      enabled: true,
      touchTooltipData: BarTouchTooltipData(
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          final label = rodIndex == 0 ? 'Income' : 'Expense';
          return BarTooltipItem(
            '$label\n₹${_formatValue(rod.toY)}',
             TextStyle(
              color:AppColor.bgcolor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          );
        },
      ),
    );

  }

  // ---------------- AXIS TITLES ----------------
  FlTitlesData _titlesData(List<MonthlyOverview> data) {
    return FlTitlesData(
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: _step,
          reservedSize: 40,
          getTitlesWidget: (value, _) {
            return Text(
              '${(value / 1000).toInt()}k',
              style: const TextStyle(fontSize: 12),
            );
          },
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 36,
          getTitlesWidget: (value, _) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(data[value.toInt()].month),
            );
          },
        ),
      ),
    );
  }

  // ---------------- GRID ----------------
  FlGridData _gridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: false,
      horizontalInterval: _step,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.grey.withOpacity(0.3),
          strokeWidth: 1,
          dashArray: [6, 4],
        );
      },
    );
  }

  // ---------------- BAR GROUPS ----------------
  List<BarChartGroupData> _barGroups(List<MonthlyOverview> data) {
    return List.generate(data.length, (index) {
      final item = data[index];

      return BarChartGroupData(
        x: index,
        barsSpace: 6,
        barRods: [
          BarChartRodData(
            toY: item.income.toDouble(),
            width: 12,
            borderRadius: BorderRadius.circular(6),
            gradient: ChartColors.incomeGradient,
          ),
          BarChartRodData(
            toY: item.expense.toDouble(),
            width: 12,
            borderRadius: BorderRadius.circular(6),
            gradient: ChartColors.expenseGradient,
          ),
        ],
      );
    });
  }

  // ---------------- HELPERS ----------------
  double _roundUp(double value, double step) {
    return (value / step).ceil() * step;
  }

  String _formatValue(double value) {
    if (value >= 100000) {
      return '${(value / 100000).toStringAsFixed(1)}L';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}k';
    }
    return value.toStringAsFixed(0);
  }
}

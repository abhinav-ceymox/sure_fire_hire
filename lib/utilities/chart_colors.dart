import 'package:flutter/material.dart';

class ChartColors {
  static const incomeGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color(0xFF4EC6E0),
      Color(0xFF2B9ED8),
    ],
  );

  static const expenseGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color(0xFFFFC08A),
      Color(0xFFFF8C42),
    ],
  );
}

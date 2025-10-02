import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minY: 0,
        maxY: 60,
        gridData: FlGridData(show: true, drawVerticalLine: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 28),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 22),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        lineTouchData: LineTouchData(enabled: true),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          _line(
            points: const [10, 18, 12, 20, 36, 28],
            color: AppColors.accent,
          ),
          _line(
            points: const [22, 14, 10, 26, 55, 40],
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }

  LineChartBarData _line({required List<double> points, required Color color}) {
    return LineChartBarData(
      isCurved: true,
      barWidth: 4,
      color: color,
      dotData: FlDotData(show: false),
      spots: [
        for (int i = 0; i < points.length; i++) FlSpot(i.toDouble(), points[i]),
      ],
    );
  }
}
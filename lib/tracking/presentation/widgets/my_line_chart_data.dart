import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils_export.dart';

class MyLineChartData extends StatelessWidget {
  const MyLineChartData({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
          lineTouchData: const LineTouchData(
            enabled: false,
          ),
          backgroundColor: Colors.white,
          minX: 0,
          minY: 0,
          maxX: 12,
          maxY: 12,
          borderData: FlBorderData(
            border: Border.all(color: Colors.grey, style: BorderStyle.none),
          ),
          titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                interval: 3,
                showTitles: false,
                getTitlesWidget: (value, meta) => Text(value.toString()),
              )),
              leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: false,
                interval: 3,
                getTitlesWidget: (value, meta) => Text(value.toString()),
              )),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false))),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              dotData: const FlDotData(
                show: false,
              ),
              spots: [
                const FlSpot(0, 5),
                const FlSpot(3, 3),
                const FlSpot(6, 7),
                const FlSpot(9, 6),
                const FlSpot(12, 10)
              ],
              barWidth: 5,
              gradient: const LinearGradient(
                colors: [
                  AppColors.BLUE,
                  AppColors.MINT,
                ],
              ),
            )
          ],
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) {
              if (value % 2 == 0) {
                return FlLine(
                  color: Colors.grey.withOpacity(0.3),
                  strokeWidth: 1,
                );
              } else {
                return const FlLine(
                  color: Colors.transparent,
                );
              }
            },
            getDrawingVerticalLine: (value) {
              if (value % 2 == 0) {
                return FlLine(
                  color: Colors.grey.withOpacity(0.3),
                  strokeWidth: 1,
                );
              } else {
                return const FlLine(
                  color: Colors.transparent,
                );
              }
            },
            horizontalInterval: 1,
            verticalInterval: 1,
          )),
    );
  }
}

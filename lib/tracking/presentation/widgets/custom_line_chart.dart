import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/view_models/tracking_screen_view_model.dart';

import '../../../core/utils/utils_export.dart';
import '../view_models/activity_screen_view_model.dart';

class CustomLineChart extends ConsumerWidget {
  const CustomLineChart(
      {super.key, required this.index, required this.selectedDate});

  final int index;
  final String selectedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(trackingScreenViewModelProvider(index));
    final notifier = ref.read(activityScreenViewModelProvider.notifier);
    final valuesList = notifier.getSelectedMonth(index, selectedDate);
    final double maxX = 31;
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(getTooltipColor: (barSpot) {
            return AppColors.TOOL_TIP_COLOR;
          }, getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                  notifier.convertYValue(touchedSpot.y, activity.maxValue),
                  TextStyle(color: Color(activity.color)));
            }).toList();
          }),
          getTouchedSpotIndicator: (barData, spotIndexes) {
            return spotIndexes.map((index) {
              return TouchedSpotIndicatorData(
                FlLine(
                    color: Color(activity.color).withOpacity(0.4),
                    strokeWidth: 2),
                FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, bar, index) {
                      return FlDotCirclePainter(
                        radius: 6,
                        color: Colors.transparent,
                        strokeColor: AppColors.WHITE,
                      );
                    }),
              );
            }).toList();
          },
        ),
        lineBarsData: [
          LineChartBarData(
            preventCurveOverShooting: true,
            color: Color(activity.color),
            gradient:
                LinearGradient(colors: AppColors.getGradient(activity.color)),
            isCurved: true,
            barWidth: 3,
            //curveSmoothness: 0.3,
            spots: getFlSpot(valuesList),
            dotData: FlDotData(
              show: true,
              getDotPainter: (FlSpot spot, double percent, LineChartBarData bar,
                  int index) {
                return FlDotCirclePainter(
                  radius: 2, // 점의 반지름
                  color: AppColors.WHITE, // 점의 색상
                  strokeWidth: 3, // 점 외곽선 두께
                  strokeColor: Color(activity.color), // 점 외곽선 색상
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(colors: [
                for(var a in AppColors.getGradient(activity.color)) a.withOpacity(0.2)
              ]),
            ),
          ),
        ],
        maxY: 26,
        minY: 0,
        maxX: maxX,
        minX: 0,
        borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(color: AppColors.SHADOW_GREY, width: 1),
          ),
        ),
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 6,
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  int day = value.toInt();
                  if ((day % 5 == 0 && day != 0) || day == 1) {
                    return Text(
                      '$day',
                      style: TextStyle(fontSize: 12.sp),
                    );
                  }
                  return Text(' ');
                }),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 35,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  int val = value.toInt();
                  return val % 6 == 0
                      ? Text(
                          notifier
                              .convertYValue(value, activity.maxValue)
                              .padLeft(3, '  '),
                          style: TextStyle(fontSize: 12.sp),
                        )
                      : Text('');
                }),
          ),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    );
  }

  List<FlSpot> getFlSpot(List<double?> list) {
    final List<FlSpot> spotList = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i] != null) {
        spotList.add(FlSpot(1.0 + i, list[i]!));
      }
      // else {
      //   spotList.add(FlSpot(i + 1, randomDouble().toDouble()));
      // }
    }
    return spotList;
  }

  int randomDouble() {
    final random = Random();
    int min = 1;
    int max = 24;
    return min + random.nextInt(max - min + 1);
  }
}

import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_project_2_with_android_studio/core/utils/app_colors.dart';
import 'package:mini_project_2_with_android_studio/core/utils/tracking_screen_data.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/view_models/activity_screen_view_model.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/view_models/tracking_screen_view_model.dart';

class CustomBarChart extends ConsumerWidget {
  const CustomBarChart(
      {super.key, required this.index, required this.selectedDate});

  final int index;
  final String selectedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(trackingScreenViewModelProvider(index));
    final notifier = ref.read(activityScreenViewModelProvider.notifier);
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (bar){
              return AppColors.TOOL_TIP_COLOR;
            },
            getTooltipItem: (group,groupIndex,rod,rodIndex){
              return BarTooltipItem(notifier.toolTipValue(rod.toY, activity.maxValue), TextStyle(color: Color(activity.color)));
            }
          )
        ),
        barGroups:
            getBarChartGroupData(notifier.getSelectedWeek(index, selectedDate),activity.color),
        maxY: 26,
        minY: 0,
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 6,
        ),
        borderData: FlBorderData(
          border: Border(
            bottom: BorderSide(color: AppColors.SHADOW_GREY,width: 1),
          )
        ),
        titlesData: FlTitlesData(
          show: true,
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
                          style: TextStyle(fontSize: 13.sp),
                        )
                      : Text('');
                }),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(TrackingScreenData.weeks[value.toInt()],style: TextStyle(fontSize: 16.sp,),);
                }),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getBarChartGroupData(List<double?> list, int color) {
    final List<BarChartGroupData> barList = [];
    for (int i = 0; i < 7; i++) {
      if (list[i] != null) {
        barList.add(
            BarChartGroupData(x: i, barRods: [BarChartRodData(toY: list[i]!,color: Color(color),width: 13)]));
      }
      else{
        barList.add(BarChartGroupData(x: i,barRods: [BarChartRodData(toY: 0)]));
      }
      // else {
      //   barList.add(BarChartGroupData(
      //       x: i, barRods: [BarChartRodData(toY: randomDouble().toDouble(),color: Color(color),width: 13)]));
      // }
    }
    return barList;
  }

  int randomDouble() {
    final random = Random();
    int min = 1;
    int max = 24;
    return min + random.nextInt(max - min + 1);
  }
}

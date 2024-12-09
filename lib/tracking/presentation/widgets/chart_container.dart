import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/utils/app_colors.dart';
import 'custom_bar_chart.dart';
import 'custom_line_chart.dart';
import 'roboto_text.dart';

enum Options { week, month }

class ChartContainer extends ConsumerStatefulWidget {
  const ChartContainer(
      {super.key, required this.index, required this.selectedDate});

  final int index;
  final String selectedDate;

  @override
  ConsumerState createState() => _ChartContainerState();
}

class _ChartContainerState extends ConsumerState<ChartContainer> {
  Options option = Options.week;

  @override
  Widget build(BuildContext context) {
    final int index = widget.index;
    final String selectedDate = widget.selectedDate;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.SCAFFOLD_BACKGROUND_GREY,
        borderRadius: BorderRadius.circular(16.r)
      ),
      height: 280.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: RobotoText(
                    content: 'Statistics',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SegmentedButton<Options>(
                  style: SegmentedButton.styleFrom(
                    selectedBackgroundColor: AppColors.BLACK,
                    selectedForegroundColor: AppColors.WHITE,
                  ),
                  showSelectedIcon: false,
                  segments: [
                    ButtonSegment(
                      value: Options.week,
                      label: RobotoText(content: 'Week'),
                    ),
                    ButtonSegment(
                      value: Options.month,
                      label: RobotoText(content: 'Month'),
                    ),
                  ],
                  selected: {option},
                  onSelectionChanged: (Set<Options> newSelection) {
                    setState(() {
                      option = newSelection.first;
                    });
                  },
                ),
              ],
            ),
            Gap(20.h),
            SizedBox(
                height: 180.w,
                width: 350.w,
                child: option == Options.month
                    ? CustomLineChart(index: index, selectedDate: selectedDate)
                    : CustomBarChart(index: index, selectedDate: selectedDate)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/utils_export.dart';
import 'svg_container.dart';
import 'widgets_export.dart';

class StatisticsContainer extends StatelessWidget {
  const StatisticsContainer({
    super.key,
    required this.color,
    required this.svgPath,
    required this.content,
    required this.subContent,
  });

  final int color;
  final String svgPath;
  final String content;
  final String subContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 150.w,
      decoration: BoxDecoration(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SvgContainer(
                  color: color,
                  svgPath: svgPath,
                  containerSize: 50.w,
                  svgSize: 30.w),
            ),
            Positioned(
              bottom: 30.w,
              child: RobotoText(
                content: content,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: RobotoText(
                content: subContent,
                color: AppColors.SUBTITLE_GREY,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}

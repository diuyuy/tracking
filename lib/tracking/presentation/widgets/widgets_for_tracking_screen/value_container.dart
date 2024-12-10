import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/widgets/roboto_text.dart';

import '../../../../core/utils/app_colors.dart';
import '../svg_container.dart';

class ValueContainer extends StatelessWidget {
  const ValueContainer({
    super.key,
    required this.color,
    required this.svgPath,
    required this.value,
    required this.unit,
    required this.subContent,
  });

  final int color;
  final String svgPath;
  final String value;
  final String unit;
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
              bottom: 35.w,
              child: RichText(
                text: TextSpan(
                  text: '$value ',
                  style: GoogleFonts.roboto(
                      color: AppColors.BLACK,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: unit,
                      style: GoogleFonts.roboto(
                        color: AppColors.SUBTITLE_GREY,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
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

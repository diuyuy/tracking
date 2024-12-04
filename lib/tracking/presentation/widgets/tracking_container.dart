import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils_export.dart';
import '../view_models/activity_screen_view_model.dart';
import 'roboto_text.dart';

class TrackingContainer extends ConsumerWidget {
  const TrackingContainer({super.key, required this.index,required this.selectedDate});

  final int index;
  final String selectedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityScreenViewModelProvider);
    final notifier = ref.read(activityScreenViewModelProvider.notifier);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      width: 300.w,
      height: 90.w,
      decoration: BoxDecoration(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: RobotoText(
              content: activity[index].title,
              color: AppColors.BLACK,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(
              activity[index].svgPath,
              width: 30.w,
              height: 30.w,
              colorFilter: ColorFilter.mode(
                  Color(activity[index].color), BlendMode.srcIn),
            ),
          ),
          activity[index].values[selectedDate] != null
              ? Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                    text: TextSpan(
                        text: '${activity[index].values[selectedDate]} ',
                        style: GoogleFonts.roboto(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(activity[index].color)),
                        children: [
                          TextSpan(
                              text: activity[index].unit,
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.SUBTITLE_GREY,
                              ))
                        ]),
                  ),
                )
              : Align(
                  alignment: Alignment.bottomLeft,
                  child:
                      RobotoText(content: TrackingScreenData.inputTodayValues),
                ),
          // RobotoText(
          //   content: '${activity[index].maxValue} ',
          //   fontSize: 16.sp,
          //   fontWeight: FontWeight.w700,
          //   color: Color(activity[index].color),
          // ),
          // RobotoText(
          //   content: activity[index].unit,
          //   fontSize: 16.sp,
          //   fontWeight: FontWeight.w700,
          // )
        ],
      ),
    );
  }
}

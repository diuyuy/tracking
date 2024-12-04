import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/view_models/tracking_screen_view_model.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/widgets/chart_container.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/widgets/svg_container.dart';

import '../../../core/utils/utils_export.dart';
import '../view_models/activity_screen_view_model.dart';
import '../widgets/roboto_text.dart';

class TrackingScreen extends ConsumerWidget {
  const TrackingScreen(
      {super.key, required this.index, required this.selectedDate});

  final int index;
  final String selectedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(trackingScreenViewModelProvider(index));
    final notifier = ref.read(activityScreenViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: RobotoText(
          content: activity.title,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pushNamed(ConstRouterName.EDIT_SCREEN,
                  extra:
                      RouterArgument(index: index, selectedDate: selectedDate));
            },
            style: TextButton.styleFrom(overlayColor: AppColors.SHADOW_GREY),
            child: RobotoText(
              content: 'Edit',
              color: AppColors.BLACK,
              fontSize: 14.sp,
            ),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: AppColors.SCAFFOLD_BACKGROUND_GREY,
                  title: RobotoText(
                    content: TrackingScreenData.alertTitle,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  content: RobotoText(
                    content: TrackingScreenData.alertContent,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: RobotoText(
                        content: 'Cancel',
                        color: AppColors.BLACK,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.pop();
                        notifier.deleteActivity(index);
                      },
                      child: RobotoText(
                        content: 'Ok',
                        color: AppColors.BLACK,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              );
            },
            style: TextButton.styleFrom(overlayColor: AppColors.SHADOW_GREY),
            child: RobotoText(
              content: 'Delete',
              color: AppColors.BLACK,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                    color: AppColors.WHITE,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.0.r),
                        bottomRight: Radius.circular(24.0.r))),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        leading: Icon(Icons.table_chart_outlined,),
                        title: RobotoText(
                          content: selectedDate,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    notifier.getSelectedDateValue(index, selectedDate) != null
                        ? Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: RichText(
                                text: TextSpan(
                                  text: '${activity.values[selectedDate]} ',
                                  style: GoogleFonts.roboto(
                                    color: Color(activity.color),
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: activity.unit,
                                        style: GoogleFonts.roboto(
                                            color: AppColors.BLACK
                                                .withOpacity(0.6),
                                            fontSize: 18.sp))
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.bottomLeft,
                            child: RobotoText(
                              content: TrackingScreenData.inputTodayValues,
                              fontSize: 14.sp,
                              color: AppColors.SUBTITLE_GREY,
                            ),
                          ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SvgContainer(color: activity.color, svgPath: activity.svgPath, containerSize: 65.h, svgSize: 40.h)
                    )
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: SvgPicture.asset(
                    //     activity.svgPath,
                    //     width: 40.h,
                    //     height: 40.h,
                    //     colorFilter: ColorFilter.mode(
                    //         Color(activity.color), BlendMode.srcIn),
                    //   ),
                    // )
                  ],
                ),
              ),
              Gap(20.h),
              ChartContainer(
                index: index,
                selectedDate: selectedDate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

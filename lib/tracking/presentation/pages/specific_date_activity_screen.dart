import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils_export.dart';
import '../view_models/activity_screen_view_model.dart';
import '../widgets/widgets_export.dart';

class SpecificDateActivityScreen extends ConsumerWidget {
  const SpecificDateActivityScreen({super.key,required this.selectedDate});

  final String selectedDate;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityList = ref.watch(activityScreenViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          ConstActivityScreenData.appBarTitle,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
                onPressed: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2100),
                    initialEntryMode: DatePickerEntryMode.calendar,
                    cancelText: "Cancel",
                    confirmText: "Ok",
                  );
                },
                icon: const Icon(Icons.calendar_month_outlined)),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    SvgPathData.leaves,
                    width: 25.w,
                    height: 25.w,
                  ),
                  Gap(15.w),
                  Text(
                    WordsOfBlessing.blessing[0],
                    style: GoogleFonts.roboto(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Gap(20.h),
              Text(
                ConstActivityScreenData.bodySubTitle,
                style: GoogleFonts.roboto(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.SUBTITLE_GREY,
                ),
              ),
              Gap(30.h),
              ...[
                for (int i = 0; i < activityList.length; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0.h),
                    child: GestureDetector(
                      onTap: () => context.pushNamed(
                          ConstRouterName.TRACKING_SCREEN,
                          extra: RouterArgument(
                              index: i, selectedDate: selectedDate)),
                      child: TrackingContainer(
                        index: i,
                        selectedDate: selectedDate,
                      ),
                    ),
                  )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

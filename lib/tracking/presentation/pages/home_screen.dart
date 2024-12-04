import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/view_models/activity_screen_view_model.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/widgets/container_button.dart';

import '../../../core/utils/utils_export.dart';
import '../widgets/widgets_export.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(activityScreenViewModelProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Personal Tracking',
                style: GoogleFonts.roboto(
                  fontSize: 28.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Gap(20.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Track your daily activity & stay healthy',
                style: GoogleFonts.roboto(
                  color: AppColors.SUBTITLE_GREY,
                  fontSize: 12.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Gap(30.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0.r),
              child: SizedBox(
                height: 200.w,
                width: 200.w,
                child: const MyLineChartData(),
              ),
            ),
            Gap(50.h),
            GestureDetector(
                onTap: ()=> context.pushNamed(ConstRouterName.ACTIVITY_SCREEN,extra: notifier.today),
                child: ContainerButton(title: 'Get Started')
            )
          ],
        ),
      ),
    );
  }
}

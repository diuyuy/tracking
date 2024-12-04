import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/app_colors.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 50.w,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: Colors.black
        // ),
          borderRadius: BorderRadius.circular(16.0.r),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: AppColors.SHADOW_GREY,
                spreadRadius: 1.0,
                blurRadius: 1.0,
                offset: Offset(0, 2)
            )
          ]
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}

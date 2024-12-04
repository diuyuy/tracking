import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({super.key,required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.w,
      height: 25.w,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.BLACK,
            width: 2,
          )
      ),
    );
  }
}

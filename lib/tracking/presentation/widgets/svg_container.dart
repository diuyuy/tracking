import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgContainer extends StatelessWidget {
  const SvgContainer(
      {super.key,
      required this.color,
      required this.svgPath,
      required this.containerSize,
      required this.svgSize});

  final int color;
  final String svgPath;

  final double containerSize;
  final double svgSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
          color: Color(color).withOpacity(0.2),
          borderRadius: BorderRadius.circular(16.0.r)),
      child: Center(
        child: SvgPicture.asset(
          svgPath,
          width: svgSize,
          height: svgSize,
          colorFilter: ColorFilter.mode(Color(color), BlendMode.srcIn),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Divider(
        color: AppColors.DIVIDER_COLOR,
        thickness: 1,
        height: 0,
      ),
    );
  }
}

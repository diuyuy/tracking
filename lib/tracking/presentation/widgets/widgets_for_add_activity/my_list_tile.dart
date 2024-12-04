import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/utils_export.dart';

class MyText extends StatelessWidget {
  const MyText({super.key,required this.content});

  final String content;
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: GoogleFonts.roboto(
        fontSize: AddActivityScreenData.fontSize,
        color: AppColors.BLACK,
      ),
    );
  }
}


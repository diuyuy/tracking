import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RobotoText extends StatelessWidget {
  const RobotoText({
    super.key,
    required this.content,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.letterSpacing,
  });

  final String content;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

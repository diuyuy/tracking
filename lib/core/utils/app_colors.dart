// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppColors {
  static const Color SCAFFOLD_BACKGROUND_GREY =
      Color.fromARGB(255, 244, 246, 250);
  static const Color WHITE = Colors.white;
  static const Color BLUE = Color.fromARGB(255, 16, 187, 226);
  static const Color MINT = Color.fromARGB(255, 22, 219, 167);
  static const Color SUBTITLE_GREY = Color(0xFF616161);
  static const Color PURPLE = Color(0xFF7265E3);
  static const Color ORANGE= Color(0xFFFF934E);
  static const Color GREEN= Color(0xFF40CC7C);
  static const Color LIGHT_BLUE= Color(0xFF1EC2E5);
  static const Color RED= Color(0xFFFF555D);
  static const Color YELLOW = Color(0xFFF4C115);
  static const Color BLACK = Colors.black;
  static const Color SHADOW_GREY = Colors.grey;
  static const Color DIVIDER_COLOR = Colors.grey;
  static const Color TOOL_TIP_COLOR = Color(0xFFB0BEC5);
  static List<Color> get colorList => [
    PURPLE,
    ORANGE,
    YELLOW,
    GREEN,
    LIGHT_BLUE,
    RED,
    BLACK,
  ];
  
  static const List<Color> purpleGradient = [
    Color(0xFF7265E3),
    Color(0xFFA390F5),
  ];

  static const List<Color> orangeGradient = [
    Color(0xFFFF934E),
    Color(0xFFFFB284),
  ];

  static const List<Color> yellowGradient = [
    Color(0xFFF4C115),
    Color(0xFFFFD966),
  ];

  static const List<Color> greenGradient = [
    Color(0xFF40CC7C),
    Color(0xFF76E2A4),
  ];

  static const List<Color> blueGradient = [
    Color(0xFF1EC2E5),
    Color(0xFF62D7F0),
  ];

  static const List<Color> redGradient = [
    Color(0xFFFF555D),
    Color(0xFFFF7F84),
  ];

  static List<Color> getGradient(int color) {
    if (color == AppColors.PURPLE.value) {
      return purpleGradient;
    }
    else if (color == AppColors.ORANGE.value) {
      return orangeGradient;
    }
    else if (color == AppColors.YELLOW.value) {
      return yellowGradient;
    }
    else if (color == AppColors.LIGHT_BLUE.value) {
      return blueGradient;
    }
    else if (color == AppColors.GREEN.value) {
      return greenGradient;
    }
    else {
      return redGradient;
    }
  }
}

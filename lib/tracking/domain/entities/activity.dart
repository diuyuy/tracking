import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';

enum Chart { lineChart, barChart, none }

@freezed
class Activity with _$Activity {
  const factory Activity({
    @Default('No Info') String title,
    @Default('No Info') String maxValue,
    @Default('999999999') String min,
    @Default('0') String max,
    @Default('No Info') String unit,
    @Default('No Info') String svgPath,
    @Default(0) int color,
    // @Default(Chart.lineChart) Chart chart,
    required String startDate,
    @Default({}) Map<String, String> values,
  }) = _Activity;

  factory Activity.fromUserInput(List<dynamic> list,String day) {

    return Activity(
        title: list[0],
        values: {day:list[1]},
        min: list[1],
        max: list[1],
        maxValue: list[2],
        unit: list[3],
        svgPath: list[4],
        color: list[5],
        // chart: list[6],
        startDate: day,
        );
  }
}

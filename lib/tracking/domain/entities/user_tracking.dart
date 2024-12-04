import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_tracking.freezed.dart';

enum Chart {lineCHart,barChart,none}

@freezed
class UserTracking with _$UserTracking {
  const factory UserTracking({
    @Default('No Info') String dateTime,
    @Default('No Info') String title,
    @Default('No Info') String value,
    @Default('No Info') String unit,
    @Default('No Info') String svgPath,
    @Default(0xFF0000) int color,
    @Default(Chart.none) Chart chart,
  }) = _UserTracking;

}
import 'package:hive/hive.dart';

part 'hive_activity.g.dart';

@HiveType(typeId: 0) // Hive 클래스에 타입 ID 부여
class HiveActivity {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String maxValue;

  @HiveField(2)
  final String unit;

  @HiveField(3)
  final String svgPath;

  @HiveField(4)
  final int color;

  @HiveField(5)
  final String startDate;

  @HiveField(6)
  final Map<String, String> values;

  @HiveField(7)
  final String min;

  @HiveField(8)
  final String max;

  HiveActivity({
    this.title = 'No Info',
    this.maxValue = 'No Info',
    this.unit = 'No Info',
    this.svgPath = 'No Info',
    this.color = 0,
    required this.startDate,
    this.values = const {},
    required this.min,
    required this.max// 초기값 설정
  });
}

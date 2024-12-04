import 'package:mini_project_2_with_android_studio/tracking/domain/entities/activity.dart';

abstract class Repository {
  String get today;
  Activity editActivityValues(Activity activity, String date, String value);
  List<double?> generateWeekData(Map<String, String?> map, String date);
  List<double?> generateMonthData(Map<String,String?> map,String date);
  List<Activity> getActivities();
  void addActivity(Activity activity);
  void editActivity(Activity activity, int index);
  void deleteActivity(int index);
  Future<void> reorderList(List<Activity> newList);
}
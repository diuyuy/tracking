import 'package:hive/hive.dart';

import '../../../../core/utils/const_hive_data.dart';
import '../../../domain/entities/activity.dart';
import 'hive_activity.dart';

class LocalDataSource {
  final activityBox = Hive.box<HiveActivity>(ConstHiveData.hiveBoxName);

  void addActivity(Activity activity) {
    activityBox.add(entityToHive(activity));
  }

  void editActivity(Activity activity, int index) {
    activityBox.putAt(index, entityToHive(activity));
  }

  void deleteActivity(int index) {
    activityBox.deleteAt(index);
  }

  Activity hiveToEntity(HiveActivity hiveActivity) {
    return Activity(
        title: hiveActivity.title,
        startDate: hiveActivity.startDate,
        color: hiveActivity.color,
        svgPath: hiveActivity.svgPath,
        unit: hiveActivity.unit,
        maxValue: hiveActivity.maxValue,
        values: hiveActivity.values);
  }

  HiveActivity entityToHive(Activity activity) {
    return HiveActivity(
        title: activity.title,
        startDate: activity.startDate,
        values: activity.values,
        maxValue: activity.maxValue,
        unit: activity.unit,
        svgPath: activity.svgPath,
        color: activity.color);
  }

  List<Activity> getActivityList(){
    return activityBox.values.map((hiveActivity)=>hiveToEntity(hiveActivity)).toList();
  }

  Future<void> reorderList(List<Activity> newList) async{
    await activityBox.clear();
    await activityBox.addAll(newList.map((activity)=>entityToHive(activity)));
  }
}

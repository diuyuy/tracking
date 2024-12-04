import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/activity.dart';
import '../../domain/repositories/repository.dart';
import '../data_sources/local_data_source/local_data_source.dart';

part 'repository_impl.g.dart';

class RepositoryImpl implements Repository {
  LocalDataSource localDataSource = LocalDataSource();

  @override
  String get today => DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Activity editActivityValues(Activity activity, String date, String value) {
    final updatedValues = {...activity.values};
    updatedValues[date] = value;
    return activity.copyWith(values: updatedValues);
  }

  String simpleDateFormat(DateTime date) {
    return DateFormat('yyyy-MM').format(date);
  }

  @override
  List<double?> generateWeekData(Map<String, String?> map, String date) {
    DateTime selectedDate = DateTime.parse(date);
    DateTime startDateOfWeek =
        selectedDate.subtract(Duration(days: selectedDate.weekday - 1));
    final List<double?> list = [];
    for (int i = 0; i < 7; i++) {
      DateTime currentDate = startDateOfWeek.add(Duration(days: i));
      String yearMonth = simpleDateFormat(currentDate);
      String dayString = currentDate.day.toString().padLeft(2, '0');
      list.add(double.tryParse(map['$yearMonth-$dayString'] ?? ''));
    }
    return list;
  }

  int endOfMonth(String date) {
    DateTime selectedDate = DateTime.parse(date);
    return DateTime(selectedDate.year, selectedDate.month + 1, 1)
        .subtract(Duration(days: 1))
        .day;
  }

  @override
  List<double?> generateMonthData(Map<String, String?> map, String date) {
    DateTime selectedDate = DateTime.parse(date);
    final List<double?> list = [];
    DateTime endOfMonth = DateTime(selectedDate.year, selectedDate.month + 1, 1)
        .subtract(Duration(days: 1));
    String yearMonth = simpleDateFormat(selectedDate);
    for (int i = 1; i <= endOfMonth.day; i++) {
      list.add(double.tryParse(
          map['$yearMonth-${i.toString().padLeft(2, '0')}'] ?? ''));
    }
    return list;
  }

  @override
  List<Activity> getActivities() {
    return localDataSource.getActivityList();
  }

  @override
  void addActivity(Activity activity){
    localDataSource.addActivity(activity);
  }

  @override
  void editActivity(Activity activity, int index){
    localDataSource.editActivity(activity, index);
  }

  @override
  void deleteActivity(int index){
    localDataSource.deleteActivity(index);
  }

  @override
  Future<void> reorderList(List<Activity> newList) async {
    await localDataSource.reorderList(newList);
  }

}

@riverpod
RepositoryImpl repositoryImpl(Ref ref) {
  return RepositoryImpl();
}

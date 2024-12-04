import 'package:decimal/decimal.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/view_models/edit_activity_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/repository_impl.dart';
import '../../domain/entities/activity.dart';
import '../../domain/repositories/repository.dart';
import 'add_activity_view_model.dart';

part 'activity_screen_view_model.g.dart';

@Riverpod(keepAlive: true)
class ActivityScreenViewModel extends _$ActivityScreenViewModel {
  @override
  List<Activity> build() {
    final Repository repository = ref.read(repositoryImplProvider);
    return repository.getActivities();
  }

  String get today {
    final Repository repository = ref.read(repositoryImplProvider);
    return repository.today;
  }

  void addActivity() {
    final newActivity =
    Activity.fromUserInput(ref.read(addActivityViewModelProvider), today);
    state = [...state, newActivity];
    final Repository repository = ref.read(repositoryImplProvider);
    repository.addActivity(newActivity);
  }

  void deleteActivity(int index) {
    final newState = [...state];
    newState.removeAt(index);
    state=newState;
    final Repository repository = ref.read(repositoryImplProvider);
    repository.deleteActivity(index);
  }

  void editActivity(int index, String selectedDate) {
    final newActivity = ref.read(
        editActivityViewModelProvider(index, selectedDate));
    final updatedValues = {...state[index].values};
    updatedValues[selectedDate] = newActivity[1];
    final updatedActivity = Activity(title: newActivity[0],
        startDate: state[index].startDate,
        values: updatedValues,
        maxValue: newActivity[2],
        unit: newActivity[3],
        svgPath: newActivity[4],
        color: newActivity[5]
    );
    state = [
      for(int i =0;i<state.length;i++)
        if(index != i) state[i]
      else updatedActivity
      ];
    final Repository repository = ref.read(repositoryImplProvider);
    repository.editActivity(updatedActivity, index);
  }

  String? getSelectedDateValue(int index,String selectedDate) {
    return state[index].values[selectedDate];
  }

  List<double?> getSelectedWeek(int index, String selectedDate) {
    final Repository repository = ref.read(repositoryImplProvider);
    final maxValue = double.parse(state[index].maxValue);
    List<double?> list =
    repository.generateWeekData(state[index].values, selectedDate);
    return list.map((value) {
      return value != null ? (value / maxValue) * 24 : null;
    }).toList();
  }

  List<double?> getSelectedMonth(int index, String selectedDate) {
    final Repository repository = ref.read(repositoryImplProvider);
    final maxValue = double.parse(state[index].maxValue);
    List<double?> list =
    repository.generateMonthData(state[index].values, selectedDate);
    return list.map((value) {
      return value != null ? (value / maxValue) * 24 : null;
    }).toList();
  }

  double endOfMonth(String date) {
    DateTime selectedDate = DateTime.parse(date);
    return DateTime(selectedDate.year, selectedDate.month + 1, 1)
        .subtract(Duration(days: 1))
        .day
        .toDouble();
  }


  Future<void> reorderList(int oldIndex,int newIndex) async{
    if(newIndex >oldIndex) newIndex-=1;
    final newState = [...state];
    final activity = newState.removeAt(oldIndex);
    newState.insert(newIndex,activity);
    state = newState;
    final Repository repository = ref.read(repositoryImplProvider);
    await repository.reorderList(state);
  }

  String convertYValue(double value, String maxValue) {
    double yValue = getYValue(value, maxValue);
    final maxVal = double.parse(maxValue);
    if(maxVal>=10000.0){
      if(yValue==0) return '0';
      if(!hasDecimal(yValue)) return '${(yValue/1000).toStringAsFixed(0)}k';
      return '${(yValue/1000).toStringAsFixed(1)}k';
    }
    if(yValue%1!=0) return yValue.toStringAsFixed(1);
    return yValue.toStringAsFixed(0);
  }

  double getYValue(double value,String maxValue){
    final ratio = Decimal.parse(value.toString()) / Decimal.parse('24.0');
    return (ratio * Decimal.parse(maxValue).toRational())
        .toDouble();
  }
  bool hasDecimal(double v){
    return v%1000!=0;
  }
}

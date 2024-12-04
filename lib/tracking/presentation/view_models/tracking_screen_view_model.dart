import 'package:decimal/decimal.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/view_models/activity_screen_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/activity.dart';
import 'edit_activity_view_model.dart';

part 'tracking_screen_view_model.g.dart';

@riverpod
class TrackingScreenViewModel extends _$TrackingScreenViewModel {
  @override
  Activity build(int index) {
    final activity = ref.read(activityScreenViewModelProvider)[index];
    return activity;
  }

  void editActivity(String selectedDate){
    final newActivity = ref.read(
        editActivityViewModelProvider(index, selectedDate));
    final updatedValues = {...state.values};
    updatedValues[selectedDate] = newActivity[1];
    state = Activity(title: newActivity[0],
    startDate: state.startDate,
    values: updatedValues,
    maxValue: newActivity[2],
    unit: newActivity[3],
    svgPath: newActivity[4],
    color: newActivity[5]);
  }
}

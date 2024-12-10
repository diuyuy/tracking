import 'package:mini_project_2_with_android_studio/tracking/presentation/view_models/activity_screen_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/repository_impl.dart';
import '../../domain/entities/activity.dart';
import '../../domain/repositories/repository.dart';
import 'edit_activity_view_model.dart';

part 'tracking_screen_view_model.g.dart';

@riverpod
class TrackingScreenViewModel extends _$TrackingScreenViewModel {
  @override
  Activity build(int index) {
    final activity = ref.read(activityScreenViewModelProvider)[index];
    return activity;
  }

  String get today {
    final Repository repository = ref.read(repositoryImplProvider);
    return repository.today;
  }

  void editActivity(String selectedDate) {
    final bool isBefore =
        DateTime.parse(selectedDate).isBefore(DateTime.parse(today));
    final newActivity =
        ref.read(editActivityViewModelProvider(index, selectedDate));
    final updatedValues = {...state.values};
    updatedValues[selectedDate] = newActivity[1];
    state = Activity(
        title: newActivity[0],
        startDate: isBefore ? selectedDate : state.startDate,
        min: (double.parse(newActivity[1]) < double.parse(state.min))
            ? newActivity[1]
            : state.min,
        max: (double.parse(newActivity[1]) > double.parse(state.max))
            ? newActivity[1]
            : state.max,
        values: updatedValues,
        maxValue: newActivity[2],
        unit: newActivity[3],
        svgPath: newActivity[4],
        color: newActivity[5]);
  }

  String get max => state.values.values.reduce((current, next) =>
        double.parse(current) > double.parse(next) ? current : next);

  String get min => state.values.values.reduce((current, next) =>
  double.parse(current) < double.parse(next) ? current : next);

}

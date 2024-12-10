import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/view_models/activity_screen_view_model.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/widgets/widgets_for_add_activity/color_container.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/widgets/widgets_for_add_activity/my_divider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/utils_export.dart';

part 'add_activity_view_model.g.dart';

enum Input {none}

@riverpod
class AddActivityViewModel extends _$AddActivityViewModel {
  @override
  List<dynamic> build() {
    return List.filled(6, Input.none);
  }

  void addTextFieldInput(int index, String element) {
    switch (index) {
      case 0:
        addTitle(element);
      case 1:
        addValue(element);
      case 2:
        addMaxValue(element);
      case 3:
        addUnit(element);
    }
  }

  void addTitle(String element) {
    if (element.isNotEmpty) {
      final newState = [...state];
      newState[0] = element;
      state = newState;
    } else {
      final newState = [...state];
      newState[0] = Input.none;
      state = newState;
    }
  }

  void addValue(String element) {
    if (element.isNotEmpty) {
      final newState = [...state];
      newState[1] = element;
      state = newState;
    } else {
      final newState = [...state];
      newState[1] = Input.none;
      state = newState;
    }
  }

  void addMaxValue(String element) {
    if (element.isNotEmpty) {
      final newState = [...state];
      newState[2] = element;
      state = newState;
    } else {
      final newState = [...state];
      newState[2] = Input.none;
      state = newState;
    }
  }

  void addUnit(String element) {
    if (element.isNotEmpty) {
      final newState = [...state];
      newState[3] = element;
      state = newState;
    } else {
      final newState = [...state];
      newState[3] = Input.none;
      state = newState;
    }
  }

  void addIcon(String element) {
    final newState = [...state];
    newState[4] = element;
    state = newState;
  }

  void addIconColor(int element) {
    final newState = [...state];
    newState[5] = element;
    state = newState;
  }

  Widget errorPrint() {
    return Text(
      'Please fill in all the fields.',
      style: GoogleFonts.roboto(
        color: Colors.red,
      ),
    );
  }

  void showIconModalBottomSheet(BuildContext context,List<String> svgPathList) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.WHITE,
      builder: (context) => SizedBox(
        height: 350.h,
        child: ListView(children: [
          Gap(20),
          ...[
            for (int i = 0; i < svgPathList.length * 2; i++)
              i % 2 == 0
                  ? ListTile(
                title: SvgPicture.asset(
                  svgPathList[i ~/ 2],
                  width: 30.w,
                  height: 30.w,
                ),
                onTap: () {
                  addIcon(svgPathList[i ~/ 2]);
                  Navigator.pop(context);
                },
              )
                  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const MyDivider(),
              ),
          ],
        ]),
      ),
    );
  }

  void showIconColorModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.WHITE,
      builder: (context) => SizedBox(
        height: 350.h,
        child: ListView(
          children: [
            Gap(20),
            ...[
              for (int i = 0; i < AddActivityScreenData.colorNameList.length * 2; i++)
                i % 2 == 0
                    ? ListTile(
                        title:
                            Text(AddActivityScreenData.colorNameList[i ~/ 2]),
                        trailing:
                            ColorContainer(color: AppColors.colorList[i ~/ 2]),
                        onTap: () {
                          addIconColor(AppColors.colorList[i ~/ 2].value);
                          Navigator.pop(context);
                        })
                    : const MyDivider(),
            ],
          ],
        ),
      ),
    );
  }

  bool get selectComplete{
    return !state.sublist(4).contains(Input.none);
  }

  bool get valueValid {
    bool checkValid = true;
    try{
      final a = double.parse(state[1] as String);
      final b = double.parse(state[2] as String);
      if(a<0||b<=0) checkValid = false;
    }catch(e){
      checkValid = false;
    }
    return checkValid;
  }
  bool validateTitle(String title){
    return ref.read(activityScreenViewModelProvider.notifier).validateTitle(title);
  }
}

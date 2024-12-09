import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/utils_export.dart';
import '../view_models/activity_screen_view_model.dart';
import '../widgets/widgets_export.dart';

class ActivityScreen extends ConsumerWidget {
  const ActivityScreen({super.key, required this.selectedDate});

  final String selectedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityList = ref.watch(activityScreenViewModelProvider);
    final notifier = ref.read(activityScreenViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          ConstActivityScreenData.appBarTitle,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
                onPressed: () async {
                  DateTime? sDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.parse(selectedDate),
                    firstDate: DateTime(2010),
                    lastDate: DateTime.parse(notifier.today),//DateTime(2100),
                    initialEntryMode: DatePickerEntryMode.calendar,
                    currentDate: DateTime.now(),
                    //DateTime.parse(selectedDate),
                    cancelText: "Cancel",
                    confirmText: "Ok",
                  );
                  if (sDate != null) {
                    String date = DateFormat('yyyy-MM-dd').format(sDate);
                    if (context.mounted) {
                      //context.pop();
                      context.pushNamed(ConstRouterName.ACTIVITY_SCREEN,
                          extra: date);
                    }
                  }
                },
                icon: const Icon(Icons.calendar_month_outlined)),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      leading: SvgPicture.asset(
                        SvgPathData.leaves,
                        width: 30.w,
                        height: 30.w,
                      ),
                      title: Text(
                        WordsOfBlessing.blessing[0],
                        style: GoogleFonts.roboto(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: RobotoText(content: '($selectedDate)',fontSize: 13.sp,),
                    ),
                    Text(
                      ConstActivityScreenData.bodySubTitle,
                      style: GoogleFonts.roboto(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.SUBTITLE_GREY,
                      ),
                    ),
                    Gap(20.h),
                  ],
                ),
              ),
              SliverReorderableList(
                itemBuilder: (context, index) {
                  return ReorderableDelayedDragStartListener(
                    key: Key(activityList[index].title),
                    index: index,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: GestureDetector(
                        onTap: () => context.pushNamed(
                            ConstRouterName.TRACKING_SCREEN,
                            extra: RouterArgument(
                                index: index, selectedDate: selectedDate)),
                        child: TrackingContainer(
                          index: index,
                          selectedDate: selectedDate,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: activityList.length,
                onReorder:(oldIndex,newIndex) async=> await notifier.reorderList(oldIndex,newIndex),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: notifier.today==selectedDate?FloatingActionButton(
        onPressed: () => context.pushNamed(ConstRouterName.ADD_ACTIVITY_SCREEN),
        backgroundColor: AppColors.WHITE,
        child: const Icon(Icons.add),
      ):null,
    );
  }
}

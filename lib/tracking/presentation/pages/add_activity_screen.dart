import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/widgets/roboto_text.dart';
import '../../../../core/utils/utils_export.dart';
import '../view_models/activity_screen_view_model.dart';
import '../view_models/add_activity_view_model.dart';
import '../widgets/widgets_for_add_activity/color_container.dart';
import '../widgets/widgets_for_add_activity/widegets_for_add_activity_export.dart';

class AddActivityScreen extends ConsumerStatefulWidget {
  const AddActivityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddActivityScreenState();
}

class _AddActivityScreenState extends ConsumerState<AddActivityScreen> {
  final List<TextEditingController> _textController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  // final MenuController _menuController = MenuController();
  bool checkValid = true;
  bool checkValueValid = true;

  // bool checkNotExistTitle =true;

  @override
  void dispose() {
    for (var a in _textController) {
      a.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(addActivityViewModelProvider);
    final notifier = ref.read(addActivityViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.grey,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          'Add new activity',
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {
                final notifier =
                ref.read(addActivityViewModelProvider.notifier);
                for (int i = 0; i < _textController.length; i++) {
                  notifier.addTextFieldInput(i, _textController[i].text);
                }
                if (inputComplete(notifier.selectComplete) &&
                    notifier.valueValid) {
                  ref
                      .read(activityScreenViewModelProvider.notifier)
                      .addActivity();
                  context.pop();
                } else {
                  setState(() {
                    checkValid = inputComplete(notifier.selectComplete);
                    checkValueValid = notifier.valueValid;
                  });
                }
              },
              child: RobotoText(
                content: AddActivityScreenData.save,
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.BLACK,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildCustomRow(0, 20),
              const MyDivider(),
              buildCustomRow(1, 10),
              const MyDivider(),
              buildCustomRow(2, 10),
              const MyDivider(),
              buildCustomRow(3, 10),
              const MyDivider(),
              MenuAnchor(
                style: MenuStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.SCAFFOLD_BACKGROUND_GREY),
                  //fixedSize: WidgetStatePropertyAll(Size(100.w,140.w)),
                ),
                alignmentOffset: Offset(1.sw, 0),
                menuChildren: [
                  MenuItemButton(
                    // style: MenuItemButton.styleFrom(
                    //   fixedSize: Size(60.w,40.w),
                    // ),
                    onPressed: ()=> notifier.showIconModalBottomSheet(context,SvgPathData.sportsSvgList),
                    child: RobotoText(content: 'Sports'),
                  ),
                  MenuItemButton(
                    onPressed: ()=> notifier.showIconModalBottomSheet(context,SvgPathData.foodsSvgList),
                    child: RobotoText(content: 'Foods'),
                  ),
                  MenuItemButton(
                    onPressed: ()=> notifier.showIconModalBottomSheet(context,SvgPathData.othersSvgList),
                    child: RobotoText(content: 'Others'),
                  ),
                ],
                builder: (BuildContext context,MenuController controller,Widget? child){
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    dense: true,
                    leading: MyText(content: AddActivityScreenData.property[4]),
                    trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      viewModel[4] == Input.none
                          ? MyText(content: 'Select')
                          : SvgPicture.asset(
                        viewModel[4] as String,
                        width: 20.w,
                        height: 20.w,
                        colorFilter: ColorFilter.mode(
                            viewModel[5] == Input.none
                                ? AppColors.BLACK
                                : Color(viewModel[5]),
                            BlendMode.srcIn),
                      ),
                      Gap(5.w),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.DIVIDER_COLOR,
                        size: 16.w,
                      )
                    ],
                  ),
                    onTap: (){
                      if(controller.isOpen){
                        controller.close();
                      }
                      else{
                        controller.open();
                      }
                    },
                  );
                },
              ),
              // ListTile(
              //   contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              //   dense: true,
              //   leading: MyText(content: AddActivityScreenData.property[4]),
              //   trailing: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       viewModel[4] == Input.none
              //           ? MyText(content: 'Select')
              //           : SvgPicture.asset(
              //         viewModel[4] as String,
              //         width: 20.w,
              //         height: 20.w,
              //         colorFilter: ColorFilter.mode(
              //             viewModel[5] == Input.none
              //                 ? AppColors.BLACK
              //                 : Color(viewModel[5]),
              //             BlendMode.srcIn),
              //       ),
              //       Gap(5.w),
              //       Icon(
              //         Icons.keyboard_arrow_down,
              //         color: AppColors.DIVIDER_COLOR,
              //         size: 16.w,
              //       )
              //     ],
              //   ),
              //   onTap: () =>
              //       ref
              //           .read(addActivityViewModelProvider.notifier)
              //           .showIconModalBottomSheet(
              //           context, SvgPathData.sportsSvgList),
              // ),
              const MyDivider(),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                dense: true,
                leading: MyText(content: AddActivityScreenData.property[5]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    viewModel[5] == Input.none
                        ? MyText(content: 'Select')
                        : ColorContainer(color: Color(viewModel[5])),
                    Gap(5.w),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.DIVIDER_COLOR,
                      size: 16.w,
                    )
                  ],
                ),
                onTap: () =>
                    ref
                        .read(addActivityViewModelProvider.notifier)
                        .showIconColorModalBottomSheet(context),
              ),
              //const MyDivider(),
              // MenuAnchor(
              //     controller: _menuController,
              //     alignmentOffset: Offset(1.sw, 0),
              //     style: MenuStyle(
              //       backgroundColor: WidgetStatePropertyAll(
              //           AppColors.SCAFFOLD_BACKGROUND_GREY),
              //     ),
              //     menuChildren: [
              //       MenuItemButton(
              //         onPressed: () {
              //           ref
              //               .read(addActivityViewModelProvider.notifier)
              //               .selectChart(Chart.lineChart);
              //         },
              //         child: MyText(
              //           content: 'Line chart',
              //         ),
              //       ),
              //       MenuItemButton(
              //         onPressed: () {
              //           ref
              //               .read(addActivityViewModelProvider.notifier)
              //               .selectChart(Chart.barChart);
              //         },
              //         child: MyText(content: 'Bar Chart'),
              //       )
              //     ],
              //     builder: (context, controller, child) {
              //       return ListTile(
              //         contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              //         dense: true,
              //         leading:
              //             MyText(content: AddActivityScreenData.property[6]),
              //         trailing: Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             viewModel[6] == Input.none
              //                 ? MyText(content: 'Select')
              //                 : Icon(
              //                     viewModel[6] == Chart.lineChart
              //                         ? Icons.show_chart
              //                         : Icons.bar_chart,
              //                     color: AppColors.BLACK,
              //                   ),
              //             Gap(5.w),
              //             Icon(
              //               Icons.keyboard_arrow_down,
              //               color: AppColors.DIVIDER_COLOR,
              //               size: 16.w,
              //             )
              //           ],
              //         ),
              //         onTap: () {
              //           if (controller.isOpen) {
              //             controller.close();
              //           } else {
              //             controller.open();
              //           }
              //         },
              //       );
              //     }),
              const MyDivider(),
              Gap(140.h),
              !checkValueValid && _textController[1].text.isNotEmpty &&
                  _textController[2].text.isNotEmpty
                  ? RobotoText(
                content: 'Please input valid value',
                color: Colors.red,
              )
                  : SizedBox(width: 10),
              !checkValid
                  ? ref.read(addActivityViewModelProvider.notifier).errorPrint()
                  : SizedBox(width: 10),
              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }

  bool inputComplete(bool value) {
    return _textController.every((e) => e.text.isNotEmpty) && value;
  }

  Widget buildCustomRow(int i, int maxLength) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            AddActivityScreenData.input[i],
            style: GoogleFonts.roboto(
              fontSize: AddActivityScreenData.fontSize,
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            width: 200.w,
            child: TextField(
              controller: _textController[i],
              maxLength: maxLength,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText:
                'Input the ${AddActivityScreenData.input[i].toLowerCase()}',
                hintStyle: GoogleFonts.roboto(
                  color: Colors.grey,
                  fontSize: AddActivityScreenData.fontSize,
                ),
                counterText: '',
                border: InputBorder.none,
              ),
              cursorColor: const Color.fromARGB(100, 0, 0, 0),
            ),
          ),
        ),
      ],
    );
  }
}

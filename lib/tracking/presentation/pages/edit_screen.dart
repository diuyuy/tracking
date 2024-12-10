import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils_export.dart';
import '../view_models/edit_activity_view_model.dart';
import '../widgets/roboto_text.dart';
import '../widgets/widgets_for_add_activity/color_container.dart';
import '../widgets/widgets_for_add_activity/widegets_for_add_activity_export.dart';

class EditScreen extends ConsumerStatefulWidget {
  const EditScreen(
      {super.key, required this.index, required this.selectedDate});

  final int index;
  final String selectedDate;

  @override
  ConsumerState createState() => _EditScreenState();
}

class _EditScreenState extends ConsumerState<EditScreen> {
  final List<TextEditingController> _textController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  bool checkValid = true;
  bool checkValueValid = true;
  bool checkTitleValid = true;

  @override
  void dispose() {
    for (var a in _textController) {
      a.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(
        editActivityViewModelProvider(widget.index, widget.selectedDate));
    final notifier = ref.read(
        editActivityViewModelProvider(widget.index, widget.selectedDate)
            .notifier);
    for (int i = 0; i < _textController.length; i++) {
      _textController[i].text = viewModel[i] as String;
    }
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.grey,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          'Edit activity',
          style: GoogleFonts.roboto(fontWeight: FontWeight.normal),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                final notifier = ref.read(editActivityViewModelProvider(
                        widget.index, widget.selectedDate)
                    .notifier);
                for (int i = 0; i < _textController.length; i++) {
                  notifier.editTextFieldInput(i, _textController[i].text);
                }
                if (inputComplete() &&
                    notifier.valueValid &&
                    notifier.validateTitle(_textController[0].text,widget.index)) {
                  ref
                      .read(editActivityViewModelProvider(
                              widget.index, widget.selectedDate)
                          .notifier)
                      .editActivity(widget.index, widget.selectedDate);

                  context.pop();
                } else {
                  setState(() {
                    checkValid = inputComplete();
                    checkValueValid = notifier.valueValid;
                    checkTitleValid =
                        notifier.validateTitle(_textController[0].text,widget.index);
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
                    backgroundColor: WidgetStatePropertyAll(
                        AppColors.SCAFFOLD_BACKGROUND_GREY)),
                alignmentOffset: Offset(1.sw, 0),
                menuChildren: [
                  MenuItemButton(
                    onPressed: () => notifier.showIconModalBottomSheet(
                        context, SvgPathData.sportsSvgList),
                    child: RobotoText(content: 'Sports'),
                  ),
                  MenuItemButton(
                    onPressed: () => notifier.showIconModalBottomSheet(
                        context, SvgPathData.foodsSvgList),
                    child: RobotoText(content: 'Foods'),
                  ),
                  MenuItemButton(
                    onPressed: () => notifier.showIconModalBottomSheet(
                        context, SvgPathData.othersSvgList),
                    child: RobotoText(content: 'Others'),
                  ),
                ],
                builder: (BuildContext context, MenuController controller,
                    Widget? child) {
                  return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      dense: true,
                      leading:
                          MyText(content: AddActivityScreenData.property[4]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            viewModel[4] as String,
                            width: 20.w,
                            height: 20.w,
                            colorFilter: ColorFilter.mode(
                                Color(viewModel[5]), BlendMode.srcIn),
                          ),
                          Gap(5.w),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.DIVIDER_COLOR,
                            size: 16.w,
                          )
                        ],
                      ),
                      onTap: () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      });
                },
              ),
              const MyDivider(),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                dense: true,
                leading: MyText(content: AddActivityScreenData.property[5]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColorContainer(color: Color(viewModel[5])),
                    Gap(5.w),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.DIVIDER_COLOR,
                      size: 16.w,
                    )
                  ],
                ),
                onTap: () => ref
                    .read(editActivityViewModelProvider(
                            widget.index, widget.selectedDate)
                        .notifier)
                    .showIconColorModalBottomSheet(context),
              ),
              const MyDivider(),
              Gap(140.h),
              !checkTitleValid
                  ? RobotoText(
                      content: 'This title already exists.',
                      color: Colors.red,
                    )
                  : SizedBox(width: 10),
              !checkValueValid &&
                      _textController[1].text.isNotEmpty &&
                      _textController[2].text.isNotEmpty
                  ? RobotoText(
                      content: 'Please input valid value',
                      color: Colors.red,
                    )
                  : SizedBox(width: 10),
              !checkValid
                  ? ref
                      .read(editActivityViewModelProvider(
                              widget.index, widget.selectedDate)
                          .notifier)
                      .errorPrint()
                  : SizedBox(width: 10),
              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }

  bool inputComplete() {
    return _textController.every((e) => e.text.isNotEmpty);
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_project_2_with_android_studio/tracking/data/data_sources/local_data_source/hive_activity.dart';

import 'core/utils/utils_export.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(HiveActivityAdapter());
  await Hive.openBox<HiveActivity>(ConstHiveData.hiveBoxName);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child) => MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: MyThemeData.themeData,
      ),
    );
  }
}

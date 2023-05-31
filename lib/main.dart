import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:tic_tac_toe/screens/home_page.dart';
import 'package:tic_tac_toe/utils.dart/theme.dart';
import 'package:tic_tac_toe/view_model/home_page_state.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();

  getIt.registerSingleton<HomePageState>(HomePageState());
  runApp(const MyApp());
}

final getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(414, 896),
        builder: (context, _) {
          return ProviderScope(
            child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: AppTheme().theme(),
              home: HomePage(),
            ),
          );
        });
  }
}

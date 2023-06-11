import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/screens/home_page.dart';
import 'package:tic_tac_toe/utils/theme.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigationKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(414, 896),
        builder: (context, _) {
          return ProviderScope(
            child: MaterialApp(
              title: 'Tic-Tac-Toe',
              debugShowCheckedModeBanner: false,
              navigatorKey: navigationKey,
              theme: AppTheme().theme(),
              home: HomePage(),
            ),
          );
        });
  }
}

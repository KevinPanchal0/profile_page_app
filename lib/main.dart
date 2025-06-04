import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_page_app/screens/profile_screen.dart';
import 'package:profile_page_app/utils/profile_app_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ProfileAppThemeData().lightTheme,
          darkTheme: ProfileAppThemeData().darkTheme,
          themeMode: ThemeMode.light,
          home: const ProfileScreen(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_page_app/screens/splash_screen.dart';
import 'package:profile_page_app/utils/profile_app_theme_data.dart';

import 'controller/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeController = Get.put(ThemeController());
  await themeController.loadPrefs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return Obx(
          () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ProfileAppThemeData().lightTheme,
            darkTheme: ProfileAppThemeData().darkTheme,
            themeMode: themeController.isDark.value
                ? ThemeMode.dark
                : ThemeMode.light,
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_page_app/screens/profile_screen.dart';
import 'package:profile_page_app/utils/profile_app_theme_data.dart';

import '../controller/theme_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ThemeController themeController = Get.find<ThemeController>();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ProfileScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.isDark.value
          ? ProfileAppThemeData().darkTheme.scaffoldBackgroundColor
          : ProfileAppThemeData().lightTheme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: '1',
              flightShuttleBuilder:
                  (
                    flightContext,
                    animation,
                    direction,
                    fromContext,
                    toContext,
                  ) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: animation.drive(
                          Tween(
                            begin: 0.8,
                            end: 1.0,
                          ).chain(CurveTween(curve: Curves.easeInOut)),
                        ),
                        child: toContext.widget,
                      ),
                    );
                  },
              child: Material(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/profile_image.png',
                  width: 120,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

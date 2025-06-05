import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:profile_page_app/controller/theme_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/profile_app_theme_data.dart';
import '../utils/skill_list.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final theme = themeController.isDark.value
          ? ProfileAppThemeData().darkTheme
          : ProfileAppThemeData().lightTheme;

      return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text("Profile"),
          centerTitle: true,
          backgroundColor: theme.scaffoldBackgroundColor,
          actions: [
            IconButton(
              onPressed: () {
                themeController.updateTheme(!themeController.isDark.value);
                Fluttertoast.showToast(
                  msg: themeController.isDark.value
                      ? "Dark mode enabled"
                      : "Light"
                            " mode "
                            "enabled",
                );
              },
              icon: Icon(
                themeController.isDark.value
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Update all your Text widgets to use theme.textTheme
              Column(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
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
                                      Tween(begin: 0.8, end: 1.0).chain(
                                        CurveTween(curve: Curves.easeInOut),
                                      ),
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
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text("Ethan Carter", style: theme.textTheme.bodyLarge),
                  SizedBox(height: 5.h),
                  Text("Software Engineer", style: theme.textTheme.bodyMedium),
                  SizedBox(height: 1.h),
                  Text("San Francisco, CA", style: theme.textTheme.bodyMedium),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About", style: theme.textTheme.bodyLarge),
                    SizedBox(height: 8.h),
                    Text(
                      "I'm a software engineer with a passion for building innovative solutions. I specialize in full-stack development and have experience with a variety of technologies. I'm always looking for new challenges and opportunities to learn and grow.",
                      textAlign: TextAlign.justify,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Skills", style: theme.textTheme.bodyLarge),
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: ScreenUtil().setWidth(360),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: skillList.map((skill) {
                          return Chip(
                            label: Text(skill),
                            backgroundColor: themeController.isDark.value
                                ? Colors.grey.shade800
                                : Colors.grey.shade200,
                            labelStyle: TextStyle(
                              color: themeController.isDark.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Projects", style: theme.textTheme.bodyLarge),
                    SizedBox(height: 8.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: themeController.isDark.value
                                ? Colors.grey.shade900
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: themeController.isDark.value
                                  ? Colors.grey.shade700
                                  : Colors.grey.shade300,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(
                                  themeController.isDark.value ? 30 : 10,
                                ),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (projects[index]["isFeatured"])
                                      Text(
                                        "Featured",
                                        style: TextStyle(
                                          color: themeController.isDark.value
                                              ? Colors.grey.shade400
                                              : Colors.grey.shade600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    Text(
                                      projects[index]["title"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: themeController.isDark.value
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      projects[index]["description"],
                                      style: TextStyle(
                                        color: themeController.isDark.value
                                            ? Colors.grey.shade300
                                            : Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  width: 100,
                                  height: 70,
                                  child: Image.asset(
                                    projects[index]["image"],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Social Links", style: theme.textTheme.bodyLarge),
                    SizedBox(height: 8.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Image.asset(
                                'assets/icons/instagram.png',
                                width: 32.w,
                                height: 32.h,
                              ),
                              onPressed: () async {
                                final url = Uri.parse(
                                  "https://www.instagram.com/_kevinpanchal?igsh=a3A2NXRvbDNwaTk4",
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(
                                    url,
                                    mode: LaunchMode.platformDefault,
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Could not open Instagram",
                                  );
                                }
                              },
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/icons/mobile.png',
                                width: 32.w,
                                height: 32.h,
                              ),
                              onPressed: () async {
                                final Uri phoneUri = Uri(
                                  path: 'tel:9313814484',
                                );
                                if (await canLaunchUrl(phoneUri)) {
                                  await launchUrl(phoneUri);
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Could not open dialer",
                                  );
                                }
                              },
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/icons/linkedin.png',
                                width: 32.w,
                                height: 32.h,
                              ),
                              onPressed: () async {
                                final url = Uri.parse(
                                  "https://www.linkedin.com/in/kevin-panchal124?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Could not open LinkedIn",
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      );
    });
  }
}

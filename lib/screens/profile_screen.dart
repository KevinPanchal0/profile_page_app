import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_page_app/utils/all_bottom_sheet_and_dialog.dart';
import 'package:profile_page_app/utils/skill_list.dart';

import '../utils/profile_app_theme_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor:
            ProfileAppThemeData().lightTheme.scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(msg: "Still Work To Do!");
            },
            icon: Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      InkWell(
                        onTap: () {
                          // AllBottomSheetAndDialog.instance
                          //     .showCamaraOrGalleryDialog(context);
                        },
                        child: CircleAvatar(
                          radius: 70.r,
                          backgroundImage: AssetImage(
                            "assets/images/profile_image.png",
                          ),
                        ),
                      ),
                      // ElevatedButton.icon(
                      //   style: const ButtonStyle(
                      //     shape: WidgetStatePropertyAll(CircleBorder()),
                      //   ),
                      //   onPressed: () {
                      //     Fluttertoast.showToast(msg: "Still Work To Do!");
                      //   },
                      //   label: Icon(
                      //     Icons.edit_outlined,
                      //     color: Colors.black,
                      //     size: 20,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Ethan Carter",
                  style: ProfileAppThemeData().lightTheme.textTheme.bodyLarge,
                ),
                SizedBox(height: 5.h),
                Text("Software Engineer"),
                SizedBox(height: 1.h),
                Text("San Francisco, CA"),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: ProfileAppThemeData().lightTheme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    textAlign: TextAlign.justify,
                    "I'm a software engineer with a passion for building innovative solutions. I specialize in full-stack development and have experience with a variety of technologies. I'm always looking for new challenges and opportunities to learn and grow.",
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
                  Text(
                    "Skills",
                    style: ProfileAppThemeData().lightTheme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),

                  SizedBox(
                    width: ScreenUtil().setWidth(360),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: skillList.map((skill) {
                        return Chip(
                          label: Text(skill),
                          backgroundColor: Colors.grey.shade200,
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
                  Text(
                    "Projects",
                    style: ProfileAppThemeData().lightTheme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    // height: ScreenUtil().setHeight(690),
                    child: ListView.builder(
                      shrinkWrap: true,

                      physics: NeverScrollableScrollPhysics(),
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            // Rounded corners
                            border: Border.all(
                              color: Colors.grey.shade300, // Light gray border
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                // Optional subtle shadow
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Left: Text
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (projects[index]["isFeatured"]) //
                                      // Optional "
                                      // Featured" label
                                      Text(
                                        "Featured",
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    Text(
                                      projects[index]["title"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      projects[index]["description"],
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Right: Image with colored background
                              SizedBox(width: 16),
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
                  ),
                ],
              ),
            ),
            // SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Social Links",
                    style: ProfileAppThemeData().lightTheme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 50.0.r),
            //   child: Divider(),
            // ),
          ],
        ),
      ),
    );
  }
}

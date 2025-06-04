import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AllBottomSheetAndDialog {
  AllBottomSheetAndDialog._();

  static final AllBottomSheetAndDialog instance = AllBottomSheetAndDialog._();

  showCamaraOrGalleryDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 110.h,
        child: Column(
          children: [
            SizedBox(height: 15.h),

            Text("Choose Option"),
            SizedBox(height: 15.h),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: InkWell(
                    onTap: () {
                      Fluttertoast.showToast(msg: "Picking the Media");
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.perm_media_outlined),

                          Text("Pick Image"),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: () {
                      Fluttertoast.showToast(msg: "Capturing the Image");
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.camera_alt_outlined),

                          Text("Capture Image"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

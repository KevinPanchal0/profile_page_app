import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  RxBool isDark = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadPrefs();
  }

  void updateTheme(bool tempBool) {
    isDark.value = tempBool;
    setPrefs();
  }

  Future<void> loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark.value = prefs.getBool("isDark") ?? false;
  }

  Future<void> setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDark", isDark.value);
  }
}

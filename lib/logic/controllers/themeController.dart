import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage box = GetStorage();
  final key = 'isDarkModes';

  saveThemeDataInBox(bool isDark) {
    box.write(key, isDark);
  }

  bool getThemeDataFromBox() {
    return box.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet =>
      getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changesTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);

    saveThemeDataInBox(!getThemeDataFromBox());
  }
}

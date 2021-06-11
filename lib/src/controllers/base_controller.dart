import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebamasuno/src/pages/movies.dart';
import 'package:pruebamasuno/src/pages/profile.dart';

class BaseController extends GetxController {
  var currentIndex = 0.obs;
  var valueSwitch = false.obs;

  List<Widget> pages = [
    Movies(),
    Profile(),
  ];

  Widget get currentPage => pages[currentIndex.value];

  changePage(int index) {
    currentIndex.value = index;
  }

  changeTheme(bool value) {
    valueSwitch.value = value;
    print('el valor es ${valueSwitch.value}');
    if (valueSwitch.value) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
  }
}

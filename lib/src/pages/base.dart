import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pruebamasuno/src/constants/utilites.dart';
import 'package:pruebamasuno/src/controllers/base_controller.dart';

class Base extends StatelessWidget {
  //accediendo a la data desde una instacia de mi getxcontroller
  final baseCtrl = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      //estableciendo mi observable, para cualquier cambios
      () => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          title: Text(
            'Movies',
            style: TextStyle(fontFamily: 'SemiBold'),
          ),
          actions: [
            //utilizo este widget para poder cambiar el tema de la app
            Switch(
                activeColor: Colors.black,
                value: baseCtrl.valueSwitch.value,
                onChanged: baseCtrl.changeTheme)
          ],
        ),
        body: baseCtrl.currentPage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: baseCtrl.currentIndex.value,
          selectedItemColor: primaryColor,
          onTap: baseCtrl.changePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.film),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

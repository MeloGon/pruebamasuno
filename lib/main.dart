import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebamasuno/src/constants/utilites.dart';
import 'package:pruebamasuno/src/pages/base.dart';
import 'package:pruebamasuno/src/pages/content.dart';
import 'package:pruebamasuno/src/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      theme: ThemeData(primaryColor: primaryColor),
      getPages: [
        GetPage(name: 'login', page: () => Login()),
        GetPage(name: 'base', page: () => Base()),
        GetPage(name: 'contentpage', page: () => Content()),
      ],
    );
  }
}

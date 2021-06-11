import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //instanciaciones para poder usar firebase
  LoginController({this.app});
  final FirebaseApp app;
  final referenceDatabase = FirebaseDatabase.instance;

  createUser({String email, String password}) {
    final ref = referenceDatabase.reference();
    ref
        .child('Clients')
        .push()
        .set({"email": email, "password": password, "name": ""}).asStream();
  }
}

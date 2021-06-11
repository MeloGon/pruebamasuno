import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController({this.app});
  final FirebaseApp app;
  final referenceDatabase = FirebaseDatabase.instance;

  updateUser({String email, String password}) {
    final ref = referenceDatabase.reference();
    ref.child('Clients').push().child('email').set(email).asStream();
  }

  updateUsers() {
    final ref = referenceDatabase.reference();
    ref.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
}

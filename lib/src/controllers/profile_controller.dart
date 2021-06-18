import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController({this.app});
  final FirebaseApp app;
  final referenceDatabase = FirebaseDatabase.instance;

  // updateUser({String email, String password}) {
  //   final ref = referenceDatabase.reference();
  //   ref.child('Clients').push().child('email').set(email).asStream();
  // }

  // updateUsers() {
  //   final ref = referenceDatabase.reference();
  //   ref.once().then((DataSnapshot snapshot) {
  //     print('Data : ${snapshot.value}');
  //   });
  // }

  getDataUser() async {
    DataSnapshot ds;
    final ref = referenceDatabase.reference();
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      print('usuario actual' + currentUser.uid);
    }
    await ref
        //.child('users/' + currentUser.uid + '/name')
        .child('users/' + currentUser.uid)
        .get()
        .then((value) {
      ds = value;
      print(ds.value);

      //return value.value;
    });

    return ds.value;
    //para la parte de abajo podriamos establecer una clase para poder usar get
    //.then((value) => {print('valorRRr' + value.value['name'])});
  }

  writeUserData(name, lastname, email) {
    final ref = referenceDatabase.reference();
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      print('usuario actual' + currentUser.uid);
    }
    ref.child('users/' + currentUser.uid).set({
      'name': name,
      'lastname': lastname,
      'email': email,
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "Nombre"),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Apellidos"),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
              ),
              Container(
                  width: Get.width * .5,
                  height: Get.height * .3,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/man.jpg'),
                  )),
              ElevatedButton(
                child: Text("Update"),
                onPressed: () {
                  /*loginCtrl.login(
                        emailController.text, passwordController.text);*/
                },
              ),
              ElevatedButton(
                child: Text("Sign Out"),
                onPressed: () {
                  Get.toNamed('login');
                  /*loginCtrl.login(
                        emailController.text, passwordController.text);*/
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

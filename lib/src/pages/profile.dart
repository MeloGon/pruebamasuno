import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pruebamasuno/src/constants/utilites.dart';
import 'package:pruebamasuno/src/widgets/widgets.dart';

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
                style: inputStyle,
                decoration: InputDecoration(hintText: "Nombre"),
              ),
              spaceSized(40),
              TextFormField(
                style: inputStyle,
                decoration: InputDecoration(hintText: "Apellidos"),
              ),
              spaceSized(40),
              TextFormField(
                style: inputStyle,
                decoration: InputDecoration(hintText: "Email"),
              ),
              spaceSized(20),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.camera_on_rectangle,
                          color: primaryColor,
                        )),
                  ),
                  Container(
                      width: Get.width * .5,
                      height: Get.height * .3,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/man.jpg'),
                      )),
                ],
              ),
              Container(
                width: Get.width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                  ),
                  child: Text(
                    "Update",
                    style: buttonStyle,
                  ),
                  onPressed: () {
                    /*loginCtrl.login(
                          emailController.text, passwordController.text);*/
                  },
                ),
              ),
              spaceSized(10),
              Container(
                width: Get.width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                  ),
                  child: Text(
                    "Sign Out",
                    style: buttonStyle,
                  ),
                  onPressed: () {
                    Get.toNamed('login');
                    /*loginCtrl.login(
                          emailController.text, passwordController.text);*/
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

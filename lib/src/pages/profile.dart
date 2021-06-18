import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pruebamasuno/src/constants/utilites.dart';
import 'package:pruebamasuno/src/controllers/profile_controller.dart';
import 'package:pruebamasuno/src/widgets/widgets.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController lastnameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final profileCtrl = Get.put(ProfileController());

  loadData() async {
    var resp = await profileCtrl.getDataUser();
    if (resp != null) {
      nameController.text = resp['name'].toString() ?? '';
      lastnameController.text = resp['lastname'].toString() ?? '';
      emailController.text = resp['email'].toString() ?? '';
    }
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    super.dispose();
  }

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
                controller: nameController,
                style: inputStyle,
                decoration: InputDecoration(hintText: "Nombre"),
              ),
              spaceSized(40),
              TextFormField(
                controller: lastnameController,
                style: inputStyle,
                decoration: InputDecoration(hintText: "Apellidos"),
              ),
              spaceSized(40),
              TextFormField(
                controller: emailController,
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
                    profileCtrl.writeUserData(nameController.text,
                        lastnameController.text, emailController.text);
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

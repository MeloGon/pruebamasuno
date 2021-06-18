import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pruebamasuno/src/constants/utilites.dart';
import 'package:pruebamasuno/src/controllers/login_controller.dart';
import 'package:pruebamasuno/src/widgets/widgets.dart';
import 'package:pruebamasuno/src/services/socialservices.dart';

class Login extends StatelessWidget {
  //controllers getx
  final loginCtrl = Get.put(LoginController());
  //controllers for textfield
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //estilos
  TextStyle headerStyle = TextStyle(fontSize: 40, fontFamily: 'SemiBold');
  //
  SocialServices socialServices = new SocialServices();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            //validacion de plataforma y muestra botones de acuerdo a ella
            //child: GetPlatform.isIOS ? isIos() : isAndroid()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Bienvenido ♡',
                  style: headerStyle,
                ),
                Spacer(),
                TextFormField(
                  style: inputStyle,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: "example@example.com",
                      suffixIcon: Icon(CupertinoIcons.person)),
                  controller: emailController,
                ),
                spaceSized(20),
                TextFormField(
                  style: inputStyle,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: "**********",
                      suffixIcon: Icon(CupertinoIcons.padlock)),
                  controller: passwordController,
                  obscureText: true,
                ),
                spaceSized(10),
                CheckboxListTile(
                  activeColor: primaryColor,
                  title: Text(
                    "Recuérdame",
                  ),
                  value: true,
                  onChanged: (newValue) {},
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                spaceSized(10),
                Container(
                  width: Get.width,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                    ),
                    child: Text(
                      "Log In",
                      style: buttonStyle,
                    ),
                    onPressed: () async {
                      validateFieldsAndValues();
                    },
                  ),
                ),
                spaceSized(20),
                socialButtons(),
              ],
            ),
          )),
        ),
      ),
    );
  }

  isIos() {
    return AppleAuthButton(
      onPressed: () {},
      style: const AuthButtonStyle(),
    );
  }

  validateFieldsAndValues() async {
    if (emailController.text != '' && passwordController.text != '') {
      await loginCtrl.createUser(
          email: emailController.text, password: passwordController.text);
      Get.toNamed('base');
    } else {
      Get.snackbar('Aviso', 'Ingrese un correo y una contraseña porfavor',
          icon: Icon(CupertinoIcons.info), overlayBlur: .20);
    }
  }

  socialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GoogleAuthButton(
          onPressed: () async {
            var resp = await socialServices.signInWithGoogle();
            print('credenciales' + resp.toString());
            Get.toNamed('base');
          },
          style: AuthButtonStyle(
            buttonType: AuthButtonType.icon,
          ),
        ),
        GetPlatform.isIOS ? isIos() : spaceSized(1),
        FacebookAuthButton(
          onPressed: () {},
          style: const AuthButtonStyle(
            buttonType: AuthButtonType.icon,
          ),
        ),
      ],
    );
  }
}

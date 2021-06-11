import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebamasuno/src/constants/utilites.dart';
import 'package:pruebamasuno/src/controllers/login_controller.dart';

class Login extends StatelessWidget {
  final loginCtrl = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              //validacion de plataforma y muestra botones de acuerdo a ella
              child: GetPlatform.isIOS
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: "example@example.com"),
                          controller: emailController,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: "**********"),
                          controller: passwordController,
                          obscureText: true,
                        ),
                        const Divider(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                          ),
                          child: Text("Log In"),
                          onPressed: () async {
                            if (emailController.text != '' &&
                                passwordController.text != '') {
                              await loginCtrl.createUser(
                                  email: emailController.text,
                                  password: passwordController.text);
                              Get.toNamed('base');
                            } else {
                              Get.snackbar('Aviso',
                                  'Ingrese un correo y una contraseña porfavor');
                            }
                          },
                        ),
                        const Divider(),
                        GoogleAuthButton(
                          onPressed: () {},
                          style: const AuthButtonStyle(),
                        ),
                        const Divider(),
                        FacebookAuthButton(
                          onPressed: () {},
                          style: const AuthButtonStyle(),
                        ),
                        const Divider(),
                        AppleAuthButton(
                          onPressed: () {},
                          style: const AuthButtonStyle(),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: "example@example.com"),
                          controller: emailController,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: "**********"),
                          controller: passwordController,
                          obscureText: true,
                        ),
                        const Divider(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                          ),
                          child: Text("Log In"),
                          onPressed: () async {
                            if (emailController.text != '' &&
                                passwordController.text != '') {
                              await loginCtrl.createUser(
                                  email: emailController.text,
                                  password: passwordController.text);
                              Get.toNamed('base');
                            } else {
                              Get.snackbar('Aviso',
                                  'Ingrese un correo y una contraseña porfavor');
                            }
                          },
                        ),
                        const Divider(),
                        GoogleAuthButton(
                          onPressed: () {},
                          style: const AuthButtonStyle(),
                        ),
                        const Divider(),
                        FacebookAuthButton(
                          onPressed: () {},
                          style: const AuthButtonStyle(),
                        ),
                      ],
                    )),
        ),
      ),
    );
  }
}

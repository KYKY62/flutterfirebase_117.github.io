// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/route_name.dart';
import 'package:get/get.dart';

import '../controllers/login_control.dart';
import '../controllers/auth_control.dart';

class LoginPage extends GetView<LoginController> {
  final AuthC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login Page")),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: controller.emailC,
                  decoration: InputDecoration(
                      label: Text("Email"), border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.passC,
                  decoration: InputDecoration(
                      label: Text("Password"), border: OutlineInputBorder()),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () => AuthC.login(
                        controller.emailC.text, controller.passC.text),
                    child: Text("Login")),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum Punya Akun ?"),
                    TextButton(
                        onPressed: () => Get.toNamed(RouteNamed.signup),
                        child: Text("Daftar Sekarang"))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

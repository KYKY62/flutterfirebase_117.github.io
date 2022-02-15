import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_control.dart';
import '../controllers/resetpass_control.dart';

class ResetPage extends GetView<ResetController> {
  final AuthC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Reset Password Page")),
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
                SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () => AuthC.resetPass(controller.emailC.text),
                    child: Text("Reset")),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sudah Punya Akun ?"),
                    TextButton(
                        onPressed: () => Get.back(), child: Text("Login"))
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

// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_control.dart';

class HomePage extends StatelessWidget {
  final AuthC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home Page")),
        actions: [
          IconButton(
            onPressed: () => AuthC.signout(),
            icon: Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}

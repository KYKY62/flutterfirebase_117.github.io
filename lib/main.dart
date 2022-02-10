// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import './routes/route.dart';
import './controllers/auth_control.dart';
import './utils/loading_view.dart';
import './routes/route_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: AuthC.streamAuthStatus,
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.active) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute:
                  snapshot.data != null && snapshot.data!.emailVerified == true
                      ? RouteNamed.home
                      : RouteNamed.login,
              getPages: AppPages.pages,
            );
          }
          return LoadingView();
        });
  }
}

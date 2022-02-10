import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/routes/binding.dart';
import 'package:get/get.dart';

import 'route_name.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteNamed.home, page: () => HomePage()),
    GetPage(
      name: RouteNamed.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteNamed.signup,
      page: () => SignupPage(),
      binding: SignUpBinding(),
    ),
  ];
}

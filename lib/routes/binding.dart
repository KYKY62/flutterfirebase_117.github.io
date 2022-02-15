import 'package:get/get.dart';

import '../controllers/login_control.dart';
import '../controllers/resetpass_control.dart';
import '../controllers/signup_control.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}

class ResetPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetController>(
      () => ResetController(),
    );
  }
}

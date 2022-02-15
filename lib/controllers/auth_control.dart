// ignore_for_file: avoid_print

import 'package:flutter_application_1/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      UserCredential MyUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (MyUser.user!.emailVerified == true) {
        Get.offAllNamed(RouteNamed.home);
      } else {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText:
              "Periksa Email Verification Dahulu or send back email verification ?",
          onConfirm: () async {
            await MyUser.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: "Roger that",
          textCancel: "Nope",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "No user found for that email.",
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Wrong password provided for that user.",
        );
      }
    }
  }

  void signup(String email, String password) async {
    try {
      UserCredential MyUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await MyUser.user!.sendEmailVerification();
      Get.defaultDialog(
        title: "Pemberitahuan",
        middleText: "Kami Telah mengirimkan verifikasi ke $email anda",
        textConfirm: "Ya, saya terima verifikasi Email tersebut",
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "The password provided is too weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "The account already exists for that email.",
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Cannot finishing form signup",
      );
    }
  }

  void signout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(RouteNamed.login);
  }

  void resetPass(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Kami telah mengirimkan link reset password ke $email",
          textConfirm: "Ya, saya mengerti",
          onConfirm: () {
            Get.back();
            Get.back();
          },
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Cannot finishing form Reset Password",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Email not valid",
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth_service.dart';

class LoginController extends GetxController {
  final _auth = AuthService();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;

  RxBool isEmailInvalid = false.obs;
  RxBool isPasswordInvalid = false.obs;

  RxBool isVisible = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    focus();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> login() async {
    isLoading.value = true;
    final result = await _auth.singInWithEmailAndPassword(
        emailController.text.trim(), passwordController.text.trim());
    if (result == null) {
      Get.snackbar("Login failed", "Your email or password is wrong",
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(131, 253, 65, 65),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));
    } else {
      Get.offAllNamed('/home');
      emailController.clear();
      passwordController.clear();
    }

    isLoading.value = false;
    update();
  }

  void focus() {
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        isEmailInvalid.value = true;
      } else {
        isEmailInvalid.value = false;
      }
      update();
    });

    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        isPasswordInvalid.value = true;
      } else {
        isPasswordInvalid.value = false;
      }
      update();
    });
  }
}

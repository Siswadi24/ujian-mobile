import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth_service.dart';

class RegisterController extends GetxController {
  final AuthService _auth = AuthService();
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late final FocusNode usernameFocusNode;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;
  late final FocusNode confirmPasswordFocusNode;

  RxBool isObsecureRegister = false.obs;
  RxBool isUsernameInvalid = false.obs;
  RxBool isEmailInvalid = false.obs;
  RxBool isPasswordInvalid = false.obs;
  RxBool isConfirmPasswordInvalid = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    usernameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();

    super.onInit();
    focus();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();

    passwordController.dispose();
    confirmPasswordController.dispose();

    usernameFocusNode.dispose();
    emailFocusNode.dispose();

    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    isUsernameInvalid.value = false;
    isEmailInvalid.value = false;

    isPasswordInvalid.value = false;
    isConfirmPasswordInvalid.value = false;
    super.dispose();
  }

  Future<void> signUp() async {
    isLoading.value = true;
    final result = await _auth.signUpWithEmailAndPassword(
      usernameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    if (result == null) {
    } else {
      usernameController.clear();
      emailController.clear();
      passwordController.clear();
    }
    Get.back();
    isLoading.value = false;
    update();
  }

  void focus() {
    usernameFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus) {
        isUsernameInvalid.value = true;
      } else {
        isUsernameInvalid.value = false;
      }
      update();
    });
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
    confirmPasswordFocusNode.addListener(() {
      if (confirmPasswordFocusNode.hasFocus) {
        isConfirmPasswordInvalid.value = true;
      } else {
        isConfirmPasswordInvalid.value = false;
      }
      update();
    });
  }
}

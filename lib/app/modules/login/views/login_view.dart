import 'package:flutter/material.dart';
import 'package:flutter_ujian_learningx/app/widgets/login/form_login.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Login',
                  style: GoogleFonts.nunito(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Welcome back',
                  style: GoogleFonts.nunito(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Please login to your account',
                  style: GoogleFonts.nunito(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const FormLogin(),
            ],
          ),
        ),
      ),
    );
  }
}

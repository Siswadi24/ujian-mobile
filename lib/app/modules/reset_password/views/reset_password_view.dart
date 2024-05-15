import 'package:flutter/material.dart';
import 'package:flutter_ujian_learningx/app/widgets/reset_password/form_reset_pass.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Reset Password',
                style: GoogleFonts.nunito(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Forgot Your Password?',
                style: GoogleFonts.nunito(
                    fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Please create your new password ya... :) ',
                style: GoogleFonts.nunito(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            const FormResetPassword(),
          ],
        ),
      ),
    );
  }
}

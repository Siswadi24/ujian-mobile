import 'package:flutter/material.dart';
import 'package:flutter_ujian_learningx/app/modules/reset_password/controllers/reset_password_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/input_validator.dart';

class FormResetPassword extends StatelessWidget {
  const FormResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResetPasswordController>();
    final formField = GlobalKey<FormState>();
    return Form(
      key: formField,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<ResetPasswordController>(
              builder: (_) => TextFormField(
                // validator: (value) {
                //   return InputValidator.emailMessageValidation(
                //       value, controller);
                // },
                controller: controller.emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Email',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: Get.width,
              child: ElevatedButton(
                // onPressed: () {},
                onPressed: controller.isLoading.value
                    ? () {}
                    : () async {
                        if (formField.currentState!.validate()) {
                          controller
                              .resetPassword(controller.emailController.text);
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 238, 217, 237),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: GetBuilder<ResetPasswordController>(
                  builder: (_) => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          "Confirm Reset Password",
                          style: GoogleFonts.nunito(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

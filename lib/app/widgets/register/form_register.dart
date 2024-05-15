import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ujian_learningx/app/modules/register/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/input_validator.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    final formField = GlobalKey<FormState>();
    return Form(
      key: formField,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                validator: (value) {
                  return InputValidator.usernameMessageValidation(
                      value, controller);
                },
                controller: controller.usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Username',
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                validator: (value) {
                  return InputValidator.emailMessageValidation(
                      value, controller);
                },
                controller: controller.emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Email',
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                validator: (value) {
                  return InputValidator.passMessageValidation(
                      value, controller);
                },
                obscureText: !controller.isObsecureRegister.value,
                controller: controller.passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.isObsecureRegister.toggle();
                      controller.update();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        controller.isObsecureRegister.value
                            ? "assets/svg/eyeSlash.svg"
                            : "assets/svg/eye.svg",
                        fit: BoxFit.cover,
                        // colorFilter: ColorFilter.mode(
                        //     controller.passNode.hasFocus
                        //         ? Colors.black
                        //         : const Color(0xFFA0A8B0),
                        //     BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: GetBuilder<RegisterController>(
              builder: (_) => TextFormField(
                validator: (value) {
                  return InputValidator.confirmPassMessageValidation(
                      value, controller);
                },
                obscureText: !controller.isObsecureRegister.value,
                controller: controller.confirmPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Confirm Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.isObsecureRegister.toggle();
                      controller.update();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        controller.isObsecureRegister.value
                            ? "assets/svg/eyeSlash.svg"
                            : "assets/svg/eye.svg",
                        fit: BoxFit.cover,
                        // colorFilter: ColorFilter.mode(
                        //     controller.passNode.hasFocus
                        //         ? Colors.black
                        //         : const Color(0xFFA0A8B0),
                        //     BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                    ? () {}
                    : () async {
                        if (formField.currentState!.validate()) {
                          controller.signUp();
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 238, 217, 237),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: GetBuilder<RegisterController>(
                  builder: (_) => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          "Register",
                          style: GoogleFonts.nunito(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don’t have an account ?",
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const WidgetSpan(
                    child: SizedBox(width: 5),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: GestureDetector(
                      onTap: () => Get.toNamed('/login'),
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.nunito(
                            color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modules/login/controllers/login_controller.dart';
import '../../utils/input_validator.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final formField = GlobalKey<FormState>();
    return Form(
      key: formField,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<LoginController>(
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
            child: GetBuilder<LoginController>(
              builder: (_) => TextFormField(
                validator: (value) {
                  return InputValidator.passMessageValidation(
                      value, controller);
                },
                obscureText: !controller.isVisible.value,
                controller: controller.passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.isVisible.toggle();
                      controller.update();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        controller.isVisible.value
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
          GestureDetector(
            onTap: () {
              Get.toNamed('/reset-password');
            },
            child: const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Lupa Password?",
                // style: text12.copyWith(color: secondaryColor),
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
                          controller.login();
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 238, 217, 237),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: GetBuilder<LoginController>(
                  builder: (_) => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          "Login",
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                      onTap: () => Get.toNamed('/register'),
                      child: Text(
                        "register",
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

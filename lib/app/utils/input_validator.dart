import 'package:get/get.dart';

class InputValidator {
  static String? usernameMessageValidation(String? value, dynamic controller) {
    if (value!.isEmpty) {
      controller.isUsernameInvalid.value = true;
      controller.update();
      return '*Username tidak boleh kosong*';
    } else if (value.length < 3) {
      controller.isUsernameInvalid.value = true;
      controller.update();
      return "*Username harus diisi setidaknya 3 karakter";
    }
    controller.isUsernameInvalid.value = false;
    controller.update();
    return null;
  }

  static String? emailMessageValidation(String? value, dynamic controller) {
    if (value!.isEmpty) {
      controller.isEmailInvalid.value = true;
      controller.update();
      return "*Email tidak boleh kosong";
    } else if (!value.isEmail) {
      controller.isEmailInvalid.value = true;
      controller.update();
      return "*Email tidak valid";
    }
    controller.isEmailInvalid.value = false;
    controller.update();
    return null;
  }

  static String? nameMessageValidation(String? value, dynamic controller) {
    if (value!.isEmpty) {
      controller.isNameInvalid.value = true;
      controller.update();
      return "*Nama lengkap tidak boleh kosong";
    } else if (value.length < 3) {
      controller.isNameInvalid.value = true;
      controller.update();
      return "*Nama lengkap harus diisi setidaknya 3 karakter";
    }
    controller.isNameInvalid.value = false;
    controller.update();
    return null;
  }

  static String? addressMessageValidation(String? value, dynamic controller) {
    if (value!.isEmpty) {
      controller.isAddressInvalid.value = true;
      controller.update();
      return "*Alamat Lengkap tidak boleh kosong";
    }
    controller.isAddressInvalid.value = false;
    controller.update();
    return null;
  }

  static String? phoneMessageValidation(String? value, dynamic controller) {
    if (value!.isEmpty) {
      controller.isPhoneInvalid.value = true;
      controller.update();
      return "*Nomor telepon tidak boleh kosong";
    } else if (value.isPhoneNumber == false) {
      controller.isPhoneInvalid.value = true;
      controller.update();
      return "*Nomor telepon tidak valid";
    }
    controller.isPhoneInvalid.value = false;
    controller.update();
    return null;
  }

  static String? passMessageValidation(String? value, dynamic controller) {
    if (value!.isEmpty) {
      controller.isPasswordInvalid.value = true;
      controller.update();
      return "*Password tidak boleh kosong";
    } else if (value.length < 6) {
      controller.isPasswordInvalid.value = true;
      controller.update();
      return "*Password harus diisi setidaknya 6 karakter";
    }
    controller.isPasswordInvalid.value = false;
    controller.update();
    return null;
  }

  //validation confirm pass
  static String? confirmPassMessageValidation(
      String? value, dynamic controller) {
    if (value!.isEmpty) {
      controller.isConfirmPasswordInvalid.value = true;
      controller.update();
      return "*Konfirmasi password tidak boleh kosong";
    } else if (value.length < 6) {
      controller.isConfirmPasswordInvalid.value = true;
      controller.update();
      return "*Konfirmasi password harus diisi setidaknya 6 karakter";
    } else if (controller.isPasswordInvalid ==
        controller.isConfirmPasswordInvalid) {
      controller.isConfirmPasswordInvalid.value = true;
      controller.update();
      return "*Konfirmasi password tidak sama";
    }
    controller.isConfirmPasswordInvalid.value = false;
    controller.update();
    return null;
  }
}

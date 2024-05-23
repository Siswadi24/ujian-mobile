import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/auth_service.dart';

class HomeController extends GetxController {
  final _auth = AuthService();
  final images = XFile('').obs;
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController hargaBarangController = TextEditingController();
  TextEditingController tahunBeliController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  //Logout
  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login');
  }

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  //Fungsi Untuk Mendapatkan Images dari penyimpanan lokal Handphone
  Future getImages(bool galery) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;

    if (galery) {
      pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );
    } else {
      pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    }

    if (pickedFile != null) {
      images.value = pickedFile;
    }
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}

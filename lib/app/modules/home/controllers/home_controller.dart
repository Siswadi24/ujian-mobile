import 'package:get/get.dart';

import '../../../services/auth_service.dart';

class HomeController extends GetxController {
  final _auth = AuthService();

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

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}

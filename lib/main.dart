import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ujian_learningx/app/modules/register/bindings/register_binding.dart';

import 'package:get/get.dart';

import 'app/modules/home/bindings/home_binding.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/register/views/register_view.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

bool isLogin = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    isLogin = user != null;
  });

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ujian Application",
      initialBinding: isLogin ? HomeBinding() : RegisterBinding(),
      // initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: isLogin ? const HomeView() : const RegisterView(),
    ),
  );
}

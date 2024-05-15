import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> singInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Login", "User not found",
            colorText: Colors.white,
            backgroundColor: const Color.fromARGB(131, 253, 65, 65),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Login", "Password is wrong",
            colorText: Colors.white,
            backgroundColor: const Color.fromARGB(131, 253, 65, 65),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));
      }
    }
    return null;
  }

  Future<User?> signUpWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Sign Up", "The password provided is too weak",
            colorText: Colors.white,
            backgroundColor: const Color.fromARGB(131, 253, 65, 65),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Sign Up", "The account already exists",
            colorText: Colors.white,
            backgroundColor: const Color.fromARGB(131, 253, 65, 65),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));
      }
    } catch (e) {
      Get.snackbar("Sign Up", "Failed");
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final RxBool obscureText = true.obs;
  late TextEditingController emailC;
  late TextEditingController passC;

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    emailC = TextEditingController();
    passC = TextEditingController();
    super.onInit();
  }

  void samar() {
    obscureText.value = !obscureText.value;
  }
}

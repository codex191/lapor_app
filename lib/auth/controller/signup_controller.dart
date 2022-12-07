import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  final RxBool obscureText = true.obs;
  final RxBool agree = false.obs;
  late TextEditingController emailC;
  late TextEditingController passC;

  @override
  void onInit() {
    emailC = TextEditingController();
    passC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }

  void samar() {
    obscureText.value = !obscureText.value;
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ResetController extends GetxController {
  final RxBool obscureText = true.obs;
  TextEditingController emailC = TextEditingController(text: "");

  @override
  void onClose() {
    emailC.dispose();
    super.onClose();
  }

  void samar() {
    obscureText.value = !obscureText.value;
  }
}

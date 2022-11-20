import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginAdminController extends GetxController {
  final RxBool obscureText = true.obs;
  TextEditingController emailC = TextEditingController(text: "");
  TextEditingController passC = TextEditingController(text: "");

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

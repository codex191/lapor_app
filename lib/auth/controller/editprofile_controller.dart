import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditProfilePageController extends GetxController {
  final RxBool obscureText = true.obs;
  final RxBool validate = true.obs;
  TextEditingController nameC = TextEditingController(text: "");
  TextEditingController passC = TextEditingController(text: "");

  @override
  void onInit() {
    passC.dispose();
    super.onClose();
  }

  void samar() {
    obscureText.value = !obscureText.value;
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomePageController extends GetxController {
  final RxBool obscureText = true.obs;
  final RxBool validate = true.obs;
  late TextEditingController nameC;

  @override
  void onInit() {
    nameC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC = TextEditingController();
    super.onClose();
  }

  void samar() {
    obscureText.value = !obscureText.value;
  }
}

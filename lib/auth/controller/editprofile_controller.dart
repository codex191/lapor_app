import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePageController extends GetxController {
  final RxBool obscureText = true.obs;
  final RxBool validate = true.obs;
  late TextEditingController nameC;
  late ImagePicker imagePicker;

  XFile? pickedImage = null;

  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String?> uploadImage(String uid) async {
    Reference storageRef = storage.ref("$uid.png");
    File file = File(pickedImage!.path);

    try {
      await storageRef.putFile(file);
      final photoUrl = await storageRef.getDownloadURL();
      resetImage();
      return photoUrl;
    } catch (err) {
      print(err);
      return null;
    }
  }

  void resetImage() {
    pickedImage = null;
    update();
  }

  void selectImage() async {
    try {
      final checkdataImage =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (checkdataImage != null) {
        print(checkdataImage.name);
        print(checkdataImage.path);
        pickedImage = checkdataImage;
      }

      update();
    } catch (err) {
      print(err);
      pickedImage = null;
      update();
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    imagePicker = ImagePicker();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    super.onClose();
  }

  void samar() {
    obscureText.value = !obscureText.value;
  }
}

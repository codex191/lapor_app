import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lapor_app/auth/controller/editprofile_controller.dart';

class EditProfilePage extends GetView<EditProfilePageController> {
  final authC = Get.find<AuthController>();
  final editC = Get.put(EditProfilePageController());

  @override
  Widget build(BuildContext context) {
    // controller.nameC.text = authC.user.value.name!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: controller.nameC,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      authC.changeProfile(controller.nameC.text);
                    },
                    decoration: InputDecoration(
                      labelText: 'Nama Baru',
                      border: OutlineInputBorder(),
                      errorText: controller.validate.value
                          ? 'Form tidak boleh kosong'
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<EditProfilePageController>(
                          builder: (c) => c.pickedImage != null
                              ? Column(
                                  children: [
                                    Container(
                                      height: 110,
                                      width: 125,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: DecorationImage(
                                                image: FileImage(
                                                  File(c.pickedImage!.path),
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: -10,
                                            right: -5,
                                            child: IconButton(
                                              onPressed: () => c.resetImage(),
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red[900],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => c
                                          .uploadImage(authC.user.value.uid!)
                                          .then((hasilKembalian) {
                                        if (hasilKembalian != null) {
                                          authC.updatePhotoUrl(hasilKembalian);
                                        }
                                      }),
                                      child: Text(
                                        "Upload",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )
                              : Text("no image"),
                        ),
                        TextButton(
                            onPressed: () => controller.selectImage(),
                            child: Text(
                              "Pilih",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () {
                      controller.nameC.text.isEmpty
                          ? controller.validate.value = true
                          : controller.validate.value = false;

                      authC.changeProfile(controller.nameC.text);
                    },
                    child: const Text(
                      'Edit Profil',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:lapor_app/auth/auth_controller.dart';

import '../../auth/controller/add_aduan_controller.dart';

class AduanPage extends GetView<AddAduan> {
  // bool _validate = false;
  // TextEditingController date = TextEditingController();
  // TextEditingController judulController = TextEditingController(text: "");
  // TextEditingController notelpController = TextEditingController(text: "");
  // TextEditingController jenislaporanController =
  //     TextEditingController(text: "");
  // TextEditingController isiLaporanController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    final aduanC = Get.put(AddAduan());
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
                  Image.asset('assets/logolaporpky.png'),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: controller.judulC,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Judul Laporan',
                      border: OutlineInputBorder(),
                      errorText: controller.validate.value
                          ? 'Form tidak boleh kosong'
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: controller.notelpC,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'No. Telpon',
                      border: OutlineInputBorder(),
                      errorText: controller.validate.value
                          ? 'Form tidak boleh kosong'
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: controller.alamatC,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Alamat',
                      border: OutlineInputBorder(),
                      errorText: controller.validate.value
                          ? 'Form tidak boleh kosong'
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                      controller: controller.dateC,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today_rounded),
                          labelText: "Select Date"),
                      onTap: () async {
                        DateTime? pickdate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickdate != null) {
                          controller.dateC.text =
                              DateFormat('yyyy-MM-dd').format(pickdate);
                        }
                      }),
                  const SizedBox(height: 16),
                  DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                    ),
                    items: [
                      "Jekan Raya",
                      "Pahandut",
                      "Bukit Batu",
                      "Sebangau",
                      "Rakumpit"
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Kecamatan",
                        hintText: "Pilih kecamatan",
                        errorText: controller.validate.value
                            ? 'Form tidak boleh kosong'
                            : null,
                      ),
                    ),
                    onChanged: (value) {
                      controller.kecC = value;
                    },
                    selectedItem: "",
                  ),
                  DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                    ),
                    items: [
                      "Jekan Raya",
                      "Pahandut",
                      "Bukit Batu",
                      "Sebangau",
                      "Rakumpit"
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Kelurahan",
                        hintText: "pilih Kelurahan",
                        errorText: controller.validate.value
                            ? 'Form tidak boleh kosong'
                            : null,
                      ),
                    ),
                    onChanged: (value) {
                      controller.kellC = value;
                    },
                    selectedItem: null,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<AddAduan>(
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
                  TextFormField(
                    controller: controller.isiLaporanC,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Isi Laporan',
                      border: OutlineInputBorder(),
                      errorText: controller.validate.value
                          ? 'Form tidak boleh kosong'
                          : null,
                    ),
                    maxLines: 5,
                    minLines: 1,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    // onPressed: () {
                    //   controller.judulC.text.isEmpty
                    //       ? controller.validate.value = true
                    //       : controller.validate.value = false;

                    // },
                    onPressed: () => controller.addAduan(
                      controller.judulC.text,
                      controller.dateC.text,
                      controller.alamatC.text,
                      controller.notelpC.text,
                      controller.kecC.toString(),
                      controller.kellC.toString(),
                      controller.isiLaporanC.text,
                    ),
                    child: const Text(
                      'Adukan',
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

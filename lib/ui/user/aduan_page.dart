import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lapor_app/auth/controller/editprofile_controller.dart';
import 'package:uuid/uuid.dart';

import '../../auth/controller/add_aduan_controller.dart';

class AduanPage extends GetView<AddAduan> {
  final authC = Get.find<AuthController>();
  final aduanC = Get.put(AddAduan());
  var uuid = Uuid();
  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(20.0),
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
                      // errorText: controller.validate.value
                      //     ? 'Form tidak boleh kosong'
                      //     : null,
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "kolom yang harus diisi";
                      }
                    },
                  ),
                  // const SizedBox(height: 16),
                  // TextFormField(
                  //   controller: controller.emailC,
                  //   textInputAction: TextInputAction.next,
                  //   decoration: InputDecoration(
                  //     labelText: 'Email',
                  //     border: OutlineInputBorder(),
                  //     // errorText: controller.validate.value
                  //     //     ? 'Form tidak boleh kosong'
                  //     //     : null,
                  //   ),
                  //   validator: (value) {
                  //     if (!GetUtils.isEmail(value!)) {
                  //       return "Harap isi email dengan benar";
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  // ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: controller.notelpC,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'No. Telpon',
                      border: OutlineInputBorder(),
                      // errorText: controller.validate.value
                      //     ? 'Form tidak boleh kosong'
                      //     : null,
                    ),
                    validator: (value) {
                      if (!GetUtils.isPhoneNumber(value!)) {
                        return "kolom yang harus diisi";
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: controller.alamatC,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Alamat',
                      border: OutlineInputBorder(),
                      // errorText: controller.validate.value
                      //     ? 'Form tidak boleh kosong'
                      //     : null,
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "kolom yang harus diisi";
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
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
                    items: [
                      "Jekan Raya",
                      "Pahandut",
                      "Bukit Batu",
                      "Sebangau",
                      "Rakumpit"
                    ],
                    validator: (value) {
                      if (value == null) {
                        return "kolom yang harus diisi";
                      }
                    },
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Kecamatan",
                        hintText: "Pilih kecamatan",
                        errorText: controller.validate.value
                            ? 'Form tidak boleh kosong'
                            : null,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      controller.kecC = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownSearch<String>(
                    items: [
                      "Banturung",
                      "Habaring Hurung",
                      "Kanarakan",
                      "Marang",
                      "Sei Gohong",
                      "Tangkiling",
                      "Tumbang Tahai",
                      "Bukit Tunggal",
                      "Menteng",
                      "Palangka",
                      "Petuk Katimpun",
                      "Langkai",
                      "Pahandut",
                      "Pahandut Seberang",
                      "Panarung",
                      "Tanjung Pinang",
                      "Tumbang Rungan",
                      "Bukit Sua",
                      "Gaung baru",
                      "Mungku Baru",
                      "Pager",
                      "Penjehang",
                      "Petuk Barunai",
                      "Petuk Bukit",
                      "Bereng Bengkel",
                      "Danau Tundai",
                      "Kalampangan",
                      "Kameloh baru",
                      "Kereng Bangkirai",
                      "Sabaru",
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Kelurahan",
                        hintText: "pilih Kelurahan",
                        errorText: controller.validate.value
                            ? 'Form tidak boleh kosong'
                            : null,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      controller.kellC = value;
                    },
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
                                          .uploadImage(uuid.v4())
                                          .then((value) {
                                        if (value != null) {
                                          controller.urlPhoto = value;
                                        } else {
                                          value == "noiamge";
                                          controller.urlPhoto = value;
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
                              : Text("Tidak Ada Gambar"),
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
                      // errorText: controller.validate.value
                      //     ? 'Form tidak boleh kosong'
                      //     : null,
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "kolom yang harus diisi";
                      } else {
                        return null;
                      }
                    },
                    maxLines: 5,
                    minLines: 1,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Obx(() => Material(
                            child: Checkbox(
                              value: controller.agree.value,
                              onChanged: (value) {
                                controller.agree.value = value ?? false;
                              },
                            ),
                          )),
                      Flexible(
                        fit: FlexFit.loose,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            text:
                                'Dengan melakukan Adukan, Saya setuju bahwasannya aduan yang dilampirkan benar adanya, dan saya bertanggung jawab penuh terhadap aduan yang telah diajukan.',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    // onPressed: () {
                    //   controller.judulC.text.isEmpty
                    //       ? controller.validate.value = true
                    //       : controller.validate.value = false;

                    // },
                    onPressed: () => controller.agree.value
                        ? controller.addAduan(
                            controller.judulC.text,
                            // controller.emailC.text,
                            controller.dateC.text,
                            controller.alamatC.text,
                            controller.notelpC.text,
                            controller.kecC.toString(),
                            controller.kellC.toString(),
                            controller.isiLaporanC.text,
                            controller.urlPhoto.toString(),
                          )
                        : null,
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

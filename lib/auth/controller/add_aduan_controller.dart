import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddAduan extends GetxController {
  late TextEditingController judulC;
  late TextEditingController dateC;
  late TextEditingController jenisLaporanC;
  late TextEditingController notelpC;
  late TextEditingController isiLaporanC;
  late TextEditingController kecCC;
  late TextEditingController kelC;
  final RxBool validate = false.obs;
  final RxBool isEmpty = false.obs;
  String? JenisAduan;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void add(String name, String price) async {
    CollectionReference aduan = firestore.collection("aduan");

    try {
      await aduan.add({
        "name": name,
        "price": price,
      });
    } catch (e) {
      Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Gagal menambahkan aduan",
          onConfirm: () => Get.back());
    }

    Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menambahkan aduan",
        onConfirm: () => Get.back());
  }

  @override
  void valiDate() {}
}

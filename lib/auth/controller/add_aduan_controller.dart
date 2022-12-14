import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lapor_app/auth/auth_controller.dart';

class AddAduan extends GetxController {
  late TextEditingController judulC;
  late TextEditingController emailC;
  late TextEditingController dateC;
  late TextEditingController alamatC;
  late TextEditingController notelpC;
  late TextEditingController isiLaporanC;
  final RxBool validate = false.obs;
  final RxBool isEmpty = false.obs;
  final RxBool agree = false.obs;
  String? JenisAduan;
  String? kecC;
  String? kellC;
  String? urlPhoto;
  late ImagePicker imagePicker;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authC = Get.find<AuthController>();

  UserCredential? userCredential;

  XFile? pickedImage = null;

  Future<String?> uploadImage(String uid) async {
    Reference storageRef = storage.ref("aduan/aduan_$uid.jpg");
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

  void addAduan(String judul, String date, String alamat, String notelp,
      String kecamatan, String kelurahan, String isilaporan, String url) async {
    CollectionReference aduan = firestore.collection("aduan");

    try {
      await aduan.add({
        "pengirim": authC.user.value.email,
        "judul": judul,
        "tanggal": date,
        "notelp": notelp,
        "alamat": alamat,
        "kecamatan": kecamatan,
        "kelurahan": kelurahan,
        "photoUrl": url,
        "isilaporan": isilaporan,
        "status": "Belum selesai",
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menambahkan aduan",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    } catch (e) {
      Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Gagal menambahkan aduan",
          onConfirm: () => Get.back());
    }
  }

  @override
  void onInit() {
    judulC = TextEditingController();
    emailC = TextEditingController();
    dateC = TextEditingController();
    notelpC = TextEditingController();
    isiLaporanC = TextEditingController();
    alamatC = TextEditingController();
    imagePicker = ImagePicker();
    super.onInit();
  }

  @override
  void onClose() {
    judulC.dispose();
    emailC.dispose();
    dateC.dispose();
    notelpC.dispose();
    isiLaporanC.dispose();
    alamatC.dispose();
    super.onClose();
  }
}

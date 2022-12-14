import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailAduanAdminController extends GetxController {
  //TODO: Implement AduanAndaController
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("aduan").doc(docID);
    return docRef.get();
  }

  void editAduan(String docID) async {
    DocumentReference docData = firestore.collection("aduan").doc(docID);

    try {
      Get.defaultDialog(
        title: "Peringatan",
        middleText: "Apakah Anda yakin ingin memproses aduan ini?",
        onConfirm: (() async {
          await docData.update({
            "status": "Diproses",
          });
          Get.back();
        }),
        onCancel: () {},
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak dapat menyelesaikan aduan",
      );
    }
  }

  void editAduanProses(String docID) async {
    DocumentReference docData = firestore.collection("aduan").doc(docID);

    try {
      Get.defaultDialog(
        title: "Peringatan",
        middleText: "Apakah Anda yakin ingin memproses aduan ini?",
        onConfirm: (() async {
          await docData.update({
            "status": "Diproses",
          });
          Get.back();
        }),
        onCancel: () {},
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak dapat menyelesaikan aduan",
      );
    }
  }

  void editAduanTolak(String docID) async {
    DocumentReference docData = firestore.collection("aduan").doc(docID);

    try {
      Get.defaultDialog(
        title: "Peringatan",
        middleText: "Apakah Anda yakin ingin menolak aduan ini?",
        onConfirm: (() async {
          await docData.update({
            "status": "Ditolak",
          });
          Get.back();
        }),
        onCancel: () {},
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak dapat menyelesaikan aduan",
      );
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

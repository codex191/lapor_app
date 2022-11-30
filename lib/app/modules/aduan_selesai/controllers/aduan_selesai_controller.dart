import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AduanSelesaiController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference aduan = firestore.collection("aduan");

    return aduan.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    Query aduan =
        firestore.collection("aduan").where("status", isEqualTo: "Selesai");
    return aduan.snapshots();
  }

  void editAduan(String docID) async {
    DocumentReference docData = firestore.collection("aduan").doc(docID);

    try {
      await docData.update({
        "status": "Selesai",
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyelesaikan aduan",
          onConfirm: (() {
            Get.back();
          }));
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailAduanSelesaiController extends GetxController {
  //TODO: Implement DetailAduanSelesaiController
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("aduan").doc(docID);
    return docRef.get();
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

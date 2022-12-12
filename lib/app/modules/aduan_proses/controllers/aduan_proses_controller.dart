import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lapor_app/auth/auth_controller.dart';

class AduanProsesController extends GetxController {
  //TODO: Implement AduanProsesController

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final authC = Get.find<AuthController>();

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("aduan").doc(docID);
    return docRef.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    Query aduan =
        firestore.collection("aduan").where("status", isEqualTo: "Diproses");
    return aduan.snapshots();
  }

  void editAduan(String docID) async {
    DocumentReference docData = firestore.collection("aduan").doc(docID);

    try {
      Get.defaultDialog(
        title: "Peringatan",
        middleText: "Apakah Anda yakin ingin menyelesaikan aduan ini?",
        onConfirm: (() async {
          await docData.update({
            "status": "Selesai",
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
  void onClose() {}
  void increment() => count.value++;
}

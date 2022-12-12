import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lapor_app/auth/auth_controller.dart';

class AduanAndaController extends GetxController {
  //TODO: Implement AduanAndaController
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final authC = Get.find<AuthController>();

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("aduan").doc(docID);
    return docRef.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    Query aduan = firestore
        .collection("aduan")
        .where("pengirim", isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .orderBy("status", descending: true);
    return aduan.snapshots();
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

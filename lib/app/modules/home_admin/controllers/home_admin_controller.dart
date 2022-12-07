import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeAdminController extends GetxController {
  //TODO: Implement HomeAdminController
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Future<AggregateQuerySnapshot>> getData() async {
    AggregateQuery aduan = firestore
        .collection("aduan")
        .where("status", isEqualTo: "Belum selesai")
        .count();

    return aduan.get();
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

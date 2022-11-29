import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LaporanMasukController extends GetxController {
  //TODO: Implement LaporanMasukController

  Future<QuerySnapshot<Object?>> getData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference aduan = firestore.collection("aduan");

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

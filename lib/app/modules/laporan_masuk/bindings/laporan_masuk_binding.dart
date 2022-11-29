import 'package:get/get.dart';

import '../controllers/laporan_masuk_controller.dart';

class LaporanMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanMasukController>(
      () => LaporanMasukController(),
    );
  }
}

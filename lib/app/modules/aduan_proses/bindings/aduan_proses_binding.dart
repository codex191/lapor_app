import 'package:get/get.dart';

import '../controllers/aduan_proses_controller.dart';

class AduanProsesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AduanProsesController>(
      () => AduanProsesController(),
    );
  }
}

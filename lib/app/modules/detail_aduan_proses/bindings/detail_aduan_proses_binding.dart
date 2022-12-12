import 'package:get/get.dart';

import '../controllers/detail_aduan_proses_controller.dart';

class DetailAduanProsesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAduanProsesController>(
      () => DetailAduanProsesController(),
    );
  }
}

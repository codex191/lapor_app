import 'package:get/get.dart';

import '../controllers/detail_aduan_selesai_controller.dart';

class DetailAduanSelesaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAduanSelesaiController>(
      () => DetailAduanSelesaiController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/aduan_selesai_controller.dart';

class AduanSelesaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AduanSelesaiController>(
      () => AduanSelesaiController(),
    );
  }
}

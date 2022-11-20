import 'package:get/get.dart';

import '../controllers/aduan_anda_controller.dart';

class AduanAndaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AduanAndaController>(
      () => AduanAndaController(),
    );
  }
}

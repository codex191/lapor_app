import 'package:get/get.dart';

import '../controllers/instansi_controller.dart';

class InstansiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstansiController>(
      () => InstansiController(),
    );
  }
}

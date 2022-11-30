import 'package:get/get.dart';

import '../controllers/disposisikan_controller.dart';

class DisposisikanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisposisikanController>(
      () => DisposisikanController(),
    );
  }
}

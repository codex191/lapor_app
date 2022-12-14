import 'package:get/get.dart';

import '../controllers/jawaban_page_controller.dart';

class JawabanPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JawabanPageController>(
      () => JawabanPageController(),
    );
  }
}

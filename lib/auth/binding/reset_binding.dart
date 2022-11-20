import 'package:get/get.dart';
import 'package:lapor_app/auth/controller/reset_controller.dart';

class ResetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetController>(() => ResetController(),
        fenix: true, tag: 'reset');
  }
}

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PertanyaanController extends GetxController {
  //TODO: Implement PertanyaanController

  Future<void> launchURL(String url,
      {bool forceWebView = false, bool enableJavaScript = false}) async {
    await launch(url);
  }

  Future<void> call(String phoneNumber) async {
    await launch('tel:$phoneNumber');
  }

  Future<void> sendSMS(String phoneNumber) async {
    await launch('sms:$phoneNumber');
  }

  Future<void> sendEmaili(String email) async {
    await launch('mailto:$email');
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

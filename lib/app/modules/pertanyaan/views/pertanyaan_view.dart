import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/pertanyaan_controller.dart';

class PertanyaanView extends GetView<PertanyaanController> {
  final pertC = Get.put(PertanyaanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hubungi Admin'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_px0ntw70.json',
                height: 300,
                width: 300),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            child: Text("WHATSAPP"),
            onPressed: (() {
              controller.launchURL('https://wa.link/lj2ecn');
            }),
          ),
          ElevatedButton(
            child: Text("TELEPON"),
            onPressed: (() {
              controller.call('+6281340866989');
            }),
          ),
          ElevatedButton(
            child: Text("SMS"),
            onPressed: (() {
              controller.sendSMS('+6281340866989');
            }),
          ),
          ElevatedButton(
            child: Text("EMAIL"),
            onPressed: (() {
              controller.sendEmaili('agustianbrian25@gmail.com');
            }),
          ),
        ],
      ),
    );
  }
}

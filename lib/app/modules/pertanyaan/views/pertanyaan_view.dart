import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/pertanyaan_controller.dart';

class PertanyaanView extends GetView<PertanyaanController> {
  const PertanyaanView({Key? key}) : super(key: key);
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
          Text(
            'PertanyaanView is working',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

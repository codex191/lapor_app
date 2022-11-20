import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/aduan_anda_controller.dart';

class AduanAndaView extends GetView<AduanAndaController> {
  const AduanAndaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AduanAndaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AduanAndaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

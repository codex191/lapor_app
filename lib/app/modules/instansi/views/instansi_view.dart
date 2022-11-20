import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/instansi_controller.dart';

class InstansiView extends GetView<InstansiController> {
  const InstansiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InstansiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'InstansiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

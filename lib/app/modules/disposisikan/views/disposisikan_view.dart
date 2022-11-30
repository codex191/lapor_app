import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/disposisikan_controller.dart';

class DisposisikanView extends GetView<DisposisikanController> {
  const DisposisikanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DisposisikanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DisposisikanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

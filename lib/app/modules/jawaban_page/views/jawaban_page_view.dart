import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jawaban_page_controller.dart';

class JawabanPageView extends GetView<JawabanPageController> {
  const JawabanPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JawabanPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'JawabanPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/disposisikan_controller.dart';

class DisposisikanView extends GetView<DisposisikanController> {
  final dispoC = Get.put(DisposisikanController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disposisikan',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              child: Lottie.network(
                  'https://assets9.lottiefiles.com/packages/lf20_un7IpQ.json',
                  height: 300,
                  width: 300),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              child: Text("Daftar Email Instansi"),
              onPressed: (() {
                controller.launchURL(
                    'https://docs.google.com/spreadsheets/d/1YFt-HIydGzAJLDLrdLVbhKbzxWfO_MBQj-OVWXGUgS8/edit?usp=sharing');
              }),
            ),
            ElevatedButton(
              child: Text("DISPOSISIKAN"),
              onPressed: (() {
                controller.sendEmaili('');
              }),
            ),
            Expanded(child: Text("")),
            Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Lapor! Palangka Raya"),
                    Text("v.1.0.0"),
                  ]),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

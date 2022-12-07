import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/disposisikan_controller.dart';

class DisposisikanView extends GetView<DisposisikanController> {
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

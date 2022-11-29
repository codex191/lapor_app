import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laporan_masuk_controller.dart';

class LaporanMasukView extends GetView<LaporanMasukController> {
  const LaporanMasukView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Masuk'),
      ),
      body: FutureBuilder<QuerySnapshot<Object?>>(
          future: controller.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var listAllAduan = snapshot.data!.docs;
              return ListView.builder(
                itemCount: listAllAduan.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                      "${(listAllAduan[index].data() as Map<String, dynamic>)["judul"]}"),
                  subtitle: Text(
                      "${(listAllAduan[index].data() as Map<String, dynamic>)["status"]}"),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

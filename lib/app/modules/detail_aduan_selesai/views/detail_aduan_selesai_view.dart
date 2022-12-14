import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_aduan_selesai_controller.dart';

class DetailAduanSelesaiView extends GetView<DetailAduanSelesaiController> {
  final detlC = Get.put(DetailAduanSelesaiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
          title: const Text('Aduan Selesai',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 75,
                    ),
                    data["photoUrl"] != "null"
                        ? Image.network(data["photoUrl"])
                        : Center(child: Text("Tidak ada gambar")),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Judul Aduan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data["judul"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Pengirim",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data["pengirim"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Nomor Telepon",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data["notelp"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Alamat",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data["alamat"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Tanggal Aduan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data["tanggal"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Kecamatan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data["kecamatan"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Kelurahan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data["kelurahan"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Aduan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data["isilaporan"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "STATUS ADUAN",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data["status"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    ElevatedButton(
                      child: Text("KIRIM JAWABAN EMAIL"),
                      onPressed: (() {
                        controller.sendEmaili(data["pengirim"]);
                      }),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    ElevatedButton(
                      child: Text("KIRIM JAWABAN SMS"),
                      onPressed: (() {
                        controller.sendSMS(data["notelp"]);
                      }),
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}

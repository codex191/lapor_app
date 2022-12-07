import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lapor_app/routes/app_routes.dart';

import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  final authC = Get.find<AuthController>();
  final adminnC = Get.put(HomeAdminController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      body: FutureBuilder<AggregateQuerySnapshot>(
          //future: controller.getData(),
          builder: (context, snapshot) {
        // print(snapshot);
        return Text(snapshot.toString());
      }),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/LogoKominfoTanpaTeks.png'),
              ),
              accountName: Text('Admin'),
              accountEmail: Text('${FirebaseAuth.instance.currentUser!.email}'),
            ),
            ListTile(
              leading: const Icon(Icons.comment),
              title: const Text('Aduan Masuk'),
              onTap: () => Get.toNamed(RouteName.LAPORANMASUK),
            ),
            ListTile(
              leading: const Icon(Icons.comment),
              title: const Text('Aduan Selesai'),
              onTap: () => Get.toNamed(RouteName.LAPORANSELESAI),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Aplikasi'),
              onTap: () => Get.toNamed(RouteName.About),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Apakah Anda yakin untuk keluar?'),
                        content: const Text('Tekan Ya jika ingin logout'),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('TIDAK')),
                          TextButton(
                              onPressed: () => authC.logout(),
                              child: Text('YA')),
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_app/app/modules/laporan_masuk/controllers/laporan_masuk_controller.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lapor_app/routes/app_routes.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  final authC = Get.find<AuthController>();
  final adC = Get.put(LaporanMasukController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          "TOTAL LAPORAN MASUK",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.all(12),
                      ),
                      Container(
                        child: Text(
                          "7",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.all(12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          "LAPORAN     BELUM SELESAI",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.all(12),
                      ),
                      Container(
                        child: Text(
                          "6",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.all(12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          "TOTAL LAPORAN SELESAI",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.all(12),
                      ),
                      Container(
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.all(12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Text(""),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/LogoUPR.png',
                    width: 75,
                    height: 75,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    'assets/LogoPemko.png',
                    width: 75,
                    height: 75,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    'assets/LogoKominfo.png',
                    width: 75,
                    height: 75,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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

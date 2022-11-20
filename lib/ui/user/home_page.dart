import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lapor_app/model/aduan.dart';
import 'package:lapor_app/ui/about_page.dart';
import 'package:lapor_app/ui/login_page.dart';
import 'package:lapor_app/ui/user/aduan_page.dart';
import 'package:lapor_app/ui/user/detail_aduan_page.dart';
import 'package:lapor_app/ui/user/profile_page.dart';
import 'package:lapor_app/ui/user/settings_page.dart';
import 'package:lapor_app/widget/menu_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueAccent,
        elevation: 4,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset('assets/LogoKominfoTanpaTeks.png'),
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/LogoKominfoTanpaTeks.png'),
              ),
              accountName:
                  Text('${FirebaseAuth.instance.currentUser!.displayName}'),
              accountEmail: Text('${FirebaseAuth.instance.currentUser!.email}'),
            ),
            ListTile(
                leading: const Icon(Icons.face),
                title: const Text('Profil Anda'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()))),
            ListTile(
                leading: const Icon(Icons.comment),
                title: const Text('Laporan Anda'),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailAduanPage()))),
            ListTile(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutPage())),
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage())),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AduanPage();
                  }));
                },
                child: const Text('Masukan Laporan Anda')),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [Image.asset('assets/LogoUPR.png')],
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.help_rounded),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lapor_app/auth/controller/home_controller.dart';
import 'package:lapor_app/routes/app_routes.dart';
import 'package:lapor_app/ui/user/aduan_page.dart';
import 'package:lottie/lottie.dart';

class HomePage extends GetView<HomePageController> {
  final authC = Get.find<AuthController>();
  final homeC = Get.put(HomePageController());
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
              // currentAccountPicture: CircleAvatar(
              //   backgroundImage: Image.network(authC.user.photoUrl!),
              // ),
              accountName: Obx(() => Text('${authC.user.value.name}')),
              accountEmail: Text('${authC.user.value.email}'),
            ),
            ListTile(
                leading: const Icon(Icons.face),
                title: const Text('Profil Anda'),
                onTap: () => Get.toNamed(RouteName.Profile)),
            ListTile(
                leading: const Icon(Icons.comment),
                title: const Text('Laporan Anda'),
                onTap: () => Get.toNamed(RouteName.AduanAnda)),
            ListTile(
              onTap: () => Get.toNamed(RouteName.About),
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
            // ListTile(
            //   leading: const Icon(Icons.settings),
            //   title: const Text('Settings'),
            //   onTap: () => Get.toNamed(RouteName.Settings),
            // ),
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
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/lottie/hello.json",
              width: 350,
              height: 350,
            ),
            ElevatedButton(
                onPressed: () => Get.toNamed(RouteName.Aduan),
                child: const Text('Masukan Laporan Anda')),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RouteName.PERTANYAAN),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.help_rounded),
      ),
    );
  }
}

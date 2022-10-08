import 'package:flutter/material.dart';
import 'package:lapor_app/ui/about_page.dart';
import 'package:lapor_app/ui/login_page.dart';
import 'package:lapor_app/ui/user/aduan_page.dart';
import 'package:lapor_app/ui/user/settings_page.dart';
import 'package:lapor_app/widget/menu_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/LogoKominfoTanpaTeks.png'),
                ),
                accountName: Text('Brian Agustian'),
                accountEmail: Text('agustianbrian25@gmail.com'),
              ),
              ListTile(
                leading: const Icon(Icons.face),
                title: const Text('Profil Anda'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                  leading: const Icon(Icons.comment),
                  title: const Text('Aduan Anda'),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AboutPage()))),
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
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage())),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AduanPage();
                    }));
                  },
                  child: const Text('Masukan Aduan Anda')),
            ],
          ),
        ));
  }
}

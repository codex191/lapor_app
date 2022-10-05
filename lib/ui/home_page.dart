import 'package:flutter/material.dart';
import 'package:lapor_app/ui/aduan_page.dart';
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
          child: SafeArea(
            child: Column(
              children: const <Widget>[
                MenuTile(title: 'Profil'),
                MenuTile(title: 'Lihat Aduan Anda'),
                MenuTile(title: 'Tentang'),
                MenuTile(title: 'Log Out'),
                Text('Lapor! App V.0.1')
              ],
            ),
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

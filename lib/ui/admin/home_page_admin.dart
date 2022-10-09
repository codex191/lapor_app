import 'package:flutter/material.dart';
import 'package:lapor_app/ui/about_page.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/LogoKominfoTanpaTeks.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.comment),
              title: const Text('Aduan Masuk'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
                leading: const Icon(Icons.save_alt),
                title: const Text('Tentang Aplikasi'),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutPage()))),
            ListTile(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutPage())),
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}

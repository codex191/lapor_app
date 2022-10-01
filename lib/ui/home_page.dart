import 'package:flutter/material.dart';
import 'package:lapor_app/widget/menu_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueAccent,
        elevation: 4,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.network(
              'https://dicoding-web-img.sgp1.cdn.digitaloceanspaces.com/original/commons/new-ui-logo.png'),
        ),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: const <Widget>[
              MenuTile(title: 'Academy'),
              MenuTile(title: 'Challenge'),
              MenuTile(title: 'Event'),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text("Test Haja"),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App'),
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset('assets/LaporTrans.png'),
              const Text('Haha Hihi')
            ],
          ),
        ],
      ),
    );
  }
}

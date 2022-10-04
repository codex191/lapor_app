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
              Container(
                padding: const EdgeInsets.all(32),
                child: const Text(
                    'Sebuah aplikasi pengaduan yang dapat digunakan oleh masyarakat Kota Palangka Raya. Aplikasi ini dibuat oleh mahasiswa Teknik Informatika Universitas Palangka Raya.',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify),
              )
            ],
          ),
        ],
      ),
    );
  }
}

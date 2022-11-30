import 'package:flutter/material.dart';
import 'package:lapor_app/model/aduan.dart';

class DetailAduanPage extends StatefulWidget {
  //final Aduan aduans;
  const DetailAduanPage({
    super.key,
  });

  @override
  State<DetailAduanPage> createState() => _DetailAduanPageState();
}

class _DetailAduanPageState extends State<DetailAduanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
          title: const Text('Aduan Anda',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Detail Aduan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

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
          backgroundColor: Colors.blue,
          leading: const BackButton(color: Colors.black),
          title: Text('Aduan Anda',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Text('haha hihi',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      )),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_app/routes/app_routes.dart';
import 'package:lapor_app/ui/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(RouteName.Login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.asset(
              './assets/LogoKominfo.png',
              width: 150,
              height: 250,
            ),
            const Text(
              'Lapor!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

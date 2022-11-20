import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lapor_app/routes/app_routes.dart';

import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => authC.logout(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        children: [
          MenuItem(
            title: "DATA ADMIN",
            imageURL: "https://picsum.photos/id/870/1500",
          ),
          MenuItem(
            title: "DATA PETUGAS",
            imageURL: "https://picsum.photos/id/878/1500",
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  MenuItem({
    Key? key,
    required this.title,
    required this.imageURL,
  }) : super(key: key);

  final String title;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == "DATA ADMIN") {
          Get.toNamed(RouteName.LAPORAN);
        } else {
          Get.toNamed(RouteName.INSTANSI);
        }
      },
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        width: Get.width,
        height: Get.width * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(
              imageURL,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

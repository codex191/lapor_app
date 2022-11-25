import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lapor_app/auth/controller/profile_controller.dart';
import 'package:lapor_app/ui/user/edit_profile_page.dart';
import 'package:lapor_app/routes/app_routes.dart';

class ProfilePage extends GetView<ProfilePageController> {
  final authC = Get.find<AuthController>();
  final profC = Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: SafeArea(
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: authC.user.value.photoUrl == "noimage"
                        ? Image.asset(
                            "assets/LogoKominfoTanpaTeks.png",
                            fit: BoxFit.cover,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.network(
                              authC.user.value.photoUrl!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text("${authC.user.value.name}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ))),
                      Text(
                        "${authC.user.value.email}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        onPressed: () => Get.toNamed(RouteName.EditProfile),
                        child: const Text(
                          'Edit Profil',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Lapor! Palangka Raya"),
                    Text("v.1.0.0"),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}

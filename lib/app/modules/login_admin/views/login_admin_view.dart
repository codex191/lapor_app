import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_admin_controller.dart';

class LoginAdminView extends GetView<LoginAdminController> {
  // bool obscureText = true;
  final logC = Get.put(LoginAdminController());
  final authC = Get.find<AuthController>();
  // final emailC = TextEditingController();
  // final passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Lottie.network(
                  'https://assets5.lottiefiles.com/packages/lf20_0jQBogOQOn.json'),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Login Admin',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: controller.emailC,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 16),
              Obx(() => TextField(
                    controller: controller.passC,
                    obscureText: controller.obscureText.value,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(controller.obscureText.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.obscureText.value =
                              !controller.obscureText.value;
                        },
                      ),
                      isDense: true,
                    ),
                  )),
              const SizedBox(height: 8),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                onPressed: () => authC.adminLogin(
                    controller.emailC.text, controller.passC.text),
                child: const Text(
                  'Masuk',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

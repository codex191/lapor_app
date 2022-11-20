import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lapor_app/auth/controller/reset_controller.dart';

class ResetPage extends GetView<ResetController> {
  bool obscureText = true;
  final resC = Get.put(ResetController());
  final authC = Get.find<AuthController>();
  // final emailC = TextEditingController();
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
              Image.asset('assets/LaporTrans.png'),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Reset Password',
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
              // TextField(
              //   obscureText: obscureText,
              //   decoration: InputDecoration(
              //     hintText: 'Password',
              //     border: const OutlineInputBorder(),
              //     focusedBorder: const OutlineInputBorder(),
              //     suffixIcon: IconButton(
              //       icon: Icon(
              //           obscureText ? Icons.visibility : Icons.visibility_off),
              //       onPressed: () {
              //         setState(() {
              //           obscureText = !obscureText;
              //         });
              //       },
              //     ),
              //     isDense: true,
              //   ),
              // ),
              // const SizedBox(height: 16),
              // TextField(
              //   obscureText: obscureText,
              //   decoration: InputDecoration(
              //     hintText: 'Masukan ulang password',
              //     border: const OutlineInputBorder(),
              //     focusedBorder: const OutlineInputBorder(),
              //     suffixIcon: IconButton(
              //       icon: Icon(
              //           obscureText ? Icons.visibility : Icons.visibility_off),
              //       onPressed: () {
              //         setState(() {
              //           obscureText = !obscureText;
              //         });
              //       },
              //     ),
              //     isDense: true,
              //   ),
              // ),
              // const SizedBox(height: 8),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                onPressed: () {
                  authC.resetPasswrod(controller.emailC.text);
                },
                child: const Text(
                  'Reset Password',
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

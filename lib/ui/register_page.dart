import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lapor_app/auth/auth.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lapor_app/ui/login_page.dart';
import 'package:lapor_app/ui/user/home_page.dart';
import 'package:lottie/lottie.dart';
import '../auth/controller/signup_controller.dart';

class RegisterPage extends GetView<SignupController> {
  // bool obscureText = true;
  final regC = Get.put(SignupController());
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
              Lottie.asset('assets/lottie/register.json',
                  height: 200, width: 200),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Register',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.emailC,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                validator: (value) {
                  if (!GetUtils.isEmail(value!)) {
                    return "invalid Email";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 16),
              Obx(() => TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    validator: (value) {
                      if (!GetUtils.isLengthGreaterThan(value, 5)) {
                        return "Minimal 5 karakter";
                      } else {
                        return null;
                      }
                    },
                  )),
              const SizedBox(height: 8),
              Row(
                children: [
                  Obx(() => Material(
                        child: Checkbox(
                          value: controller.agree.value,
                          onChanged: (value) {
                            controller.agree.value = value ?? false;
                          },
                        ),
                      )),
                  Flexible(
                    fit: FlexFit.loose,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: 'Dengan melakukan daftar, Anda setuju dengan ',
                        style: Theme.of(context).textTheme.bodyText1,
                        children: const [
                          TextSpan(
                            text: 'syarat & ketentuan Aplikasi ini',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                onPressed: () => controller.agree.value
                    ? authC.signup(
                        controller.emailC.text, controller.passC.text)
                    : null,
                child: const Text(
                  'Daftar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Divider(
                      color: Colors.black,
                    ),
                    Positioned(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 20),
                        color: Colors.white,
                        child: Text(
                          'atau',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => authC.loginGoogle(),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.grey,
                ),
                label: Text(
                  'Masuk dengan Google',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              // RichText(
              //   textAlign: TextAlign.center,
              //   text: TextSpan(
              //     text: 'Dengan melakukan daftar, Anda setuju dengan ',
              //     style: Theme.of(context).textTheme.bodyText1,
              //     children: const [
              //       TextSpan(
              //         text: 'syarat & ketentuan Aplikasi ini',
              //         style: TextStyle(decoration: TextDecoration.underline),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lapor_app/routes/app_routes.dart';
import 'package:lapor_app/ui/admin/home_page_admin.dart';
import 'package:lapor_app/ui/register_page.dart';
import 'package:lapor_app/ui/reset_page.dart';
import 'package:lapor_app/ui/user/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  final authC = Get.find<AuthController>();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/logolaporpky.png'),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Masuk',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: emailC,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passC,
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                  child: Text(
                    'Lupa Password?',
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                  onTap: () => Get.toNamed(RouteName.Reset)),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () => authC.login(emailC.text, passC.text),
                child: const Text(
                  'Masuk',
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
                onPressed: () {
                  //Fungsi untuk login via Google
                },
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
              InkWell(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Belum punya akun? ',
                    style: Theme.of(context).textTheme.bodyText1,
                    children: const [
                      TextSpan(
                        text: 'Daftar di sini',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => Get.toNamed(RouteName.Register),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

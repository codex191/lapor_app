import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lapor_app/ui/about_page.dart';
import 'package:lapor_app/ui/admin/detail_aduan_page_admin.dart';
import 'package:lapor_app/ui/admin/home_page_admin.dart';
import 'package:lapor_app/ui/login_page.dart';
import 'package:lapor_app/ui/register_page.dart';
import 'package:lapor_app/ui/reset_page.dart';
import 'package:lapor_app/ui/splash_screen.dart';
import 'package:lapor_app/ui/user/aduan_page.dart';
import 'package:lapor_app/ui/user/detail_aduan_page.dart';
import 'package:lapor_app/ui/user/edit_profile_page.dart';
import 'package:lapor_app/ui/user/home_page.dart';
import 'package:lapor_app/ui/user/profile_page.dart';
import 'package:lapor_app/ui/user/settings_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'homepage': (context) => HomePage(),
        'loginpage': (context) => LoginPage(),
        'registerpage': (context) => RegisterPage(),
        'resetpage': (context) => ResetPage(),
        'splashscreenpage': (context) => SplashScreen(),
        'aduanpage': (context) => AduanPage(),
        'profilepage': (context) => ProfilePage(),
        'aboutpage': (context) => AboutPage(),
        'settingspage': (context) => SettingsPage(),
        'homeadminpage': (context) => HomePageAdmin(),
        'detailaduanpage': (context) => DetailAduanPage(),
        'detailaduanadminpage': (context) => DetailAduanAdminPage(),
        'editprofilepage': (context) => EditProfilePage(),
      },
      initialRoute: 'splashscreenpage',
    );
  }
}

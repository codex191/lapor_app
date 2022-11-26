import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lapor_app/auth/auth_controller.dart';
import 'package:lapor_app/auth/controller/theme_controller.dart';
import 'package:lapor_app/routes/app_pages.dart';
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
import 'package:lapor_app/utils/loading.dart';

import 'firebase_options.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController(), permanent: true);
    final themeC = Get.put(ThemeController());
    return StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return Obx(() => GetMaterialApp(
                  title: 'Flutter Demo',
                  // theme: ThemeData(
                  //   primarySwatch: Colors.blue,
                  //   fontFamily: "Montserrat",
                  // ),
                  theme: themeC.isDark.value
                      ? ThemeData.dark()
                      : ThemeData.light(),
                  debugShowCheckedModeBanner: false,
                  initialRoute: snapshot.data != null &&
                          snapshot.data!.emailVerified == true
                      ? RouteName.Home
                      : RouteName.Login,
                  //home: snapshot.data != null ? HomePage() : LoginPage(),
                  getPages: AppPages.pages,
                ));
          }
          return Loading();
        });
  }
}

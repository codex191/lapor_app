import 'package:get/get.dart';
import 'package:lapor_app/app/modules/aduan_anda/views/aduan_anda_view.dart';
import 'package:lapor_app/app/modules/aduan_selesai/views/aduan_selesai_view.dart';
import 'package:lapor_app/app/modules/detail_aduan_selesai/views/detail_aduan_selesai_view.dart';
import 'package:lapor_app/app/modules/disposisikan/views/disposisikan_view.dart';
import 'package:lapor_app/app/modules/home_admin/views/home_admin_view.dart';
import 'package:lapor_app/app/modules/instansi/views/instansi_view.dart';
import 'package:lapor_app/app/modules/laporan/views/laporan_view.dart';
import 'package:lapor_app/app/modules/laporan_masuk/views/laporan_masuk_view.dart';
import 'package:lapor_app/app/modules/login_admin/views/login_admin_view.dart';
import 'package:lapor_app/app/modules/pertanyaan/views/pertanyaan_view.dart';
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
import 'package:lapor_app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.splashscreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RouteName.Login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RouteName.Register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: RouteName.Reset,
      page: () => ResetPage(),
    ),
    GetPage(
      name: RouteName.Aduan,
      page: () => AduanPage(),
    ),
    GetPage(
      name: RouteName.About,
      page: () => AboutPage(),
    ),
    GetPage(
      name: RouteName.Home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.Profile,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: RouteName.DetailAduan,
      page: () => DetailAduanPage(),
    ),
    GetPage(
      name: RouteName.EditProfile,
      page: () => EditProfilePage(),
    ),
    GetPage(
      name: RouteName.Settings,
      page: () => SettingsPage(),
    ),
    GetPage(
      name: RouteName.HomeAdmin,
      page: () => HomePageAdmin(),
    ),
    GetPage(
      name: RouteName.DetailAduanAdmin,
      page: () => DetailAduanAdminPage(),
    ),
    GetPage(
      name: RouteName.AduanAnda,
      page: () => AduanAndaView(),
    ),
    GetPage(
      name: RouteName.INSTANSI,
      page: () => InstansiView(),
    ),
    GetPage(
      name: RouteName.LAPORAN,
      page: () => LaporanView(),
    ),
    GetPage(
      name: RouteName.ADMINLOGIN,
      page: () => LoginAdminView(),
    ),
    GetPage(
      name: RouteName.PERTANYAAN,
      page: () => PertanyaanView(),
    ),
    GetPage(
      name: RouteName.LAPORANMASUK,
      page: () => LaporanMasukView(),
    ),
    GetPage(
      name: RouteName.LAPORANSELESAI,
      page: () => AduanSelesaiView(),
    ),
    GetPage(
      name: RouteName.ADMINHOME,
      page: () => HomeAdminView(),
    ),
    GetPage(
      name: RouteName.DETAILADUANSELESAI,
      page: () => DetailAduanSelesaiView(),
    ),
    GetPage(
      name: RouteName.DISPOSISIKAN,
      page: () => DisposisikanView(),
    ),
  ];
}

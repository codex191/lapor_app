import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lapor_app/routes/app_routes.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  Future<void> login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (myUser.user!.emailVerified) {
        Get.offAllNamed(RouteName.Home);
      } else {
        Get.defaultDialog(
            title: "Verifikasi Email",
            middleText:
                "Anda perlu verifiaksi email terlebih dahulu. Apakah Anda ingin kirimkan kembali verfikasi ulang?",
            onConfirm: () async {
              await myUser.user!.sendEmailVerification();
              Get.back();
            },
            textConfirm: "Kirim ulang",
            textCancel: "Kembali");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan!",
          middleText: "Tidak ada pengguna dengan email tersebut",
        );
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan!",
          middleText: "Password Anda salah",
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "Tidak dapat login",
      );
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(RouteName.Login);
  }

  Future<void> signup(String email, String password) async {
    try {
      UserCredential myUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
          title: "Verifikasi Email",
          middleText: "Kami telah mengirimkan email verifikasi ke $email.",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Ya, Saya akan cek email.");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan!",
          middleText: "Password Anda terlalu lemah",
        );
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan!",
          middleText: "Akun untuk email tersebut telah ada",
        );
      }
    } catch (e) {
      // print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "Tidak dapat mendaftarkan akun ini",
      );
    }
  }

  void resetPasswrod(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: "Berhasil",
            middleText: "Kami telah mengirimkan reset password ke $email",
            onConfirm: () {
              Get.back();
              Get.back();
            },
            textConfirm: "Ya, saya mengerti.");
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak dapat mengirimkan reset password",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Email tidak valid",
      );
    }
  }
}

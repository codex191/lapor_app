import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lapor_app/routes/app_routes.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  GoogleSignInAccount? currentUser;
  UserCredential? userCredential;

  void loginGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      GoogleSignInAccount? myAcc = await googleSignIn.signIn();
      final isSignIn = await googleSignIn.isSignedIn();
      await googleSignIn.signIn().then((value) => currentUser = value);
      if (myAcc != null) {
        print(myAcc);
        final GoogleSignInAuthentication? googleAuth =
            await myAcc.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        CollectionReference users = firestore.collection('users');
        users.doc(currentUser?.email).set({
          "uid": userCredential?.user?.uid,
          "name": currentUser?.displayName,
          "email": currentUser?.email,
          "photoUrl": currentUser?.photoUrl,
          "createAt":
              userCredential?.user?.metadata.creationTime?.toIso8601String(),
          "lastSignInTime":
              userCredential?.user?.metadata.lastSignInTime?.toIso8601String(),
        });
        Get.offAllNamed(RouteName.Home);
      } else {
        throw "Belum memilih akun google";
      }
      print(myAcc);
    } catch (error) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: error.toString(),
      );
    }
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (myUser.user!.emailVerified) {
        CollectionReference users = firestore.collection('users');
        users.doc(currentUser?.email).set({
          "uid": userCredential?.user?.uid,
          "name": currentUser?.displayName,
          "email": currentUser?.email,
          "photoUrl": currentUser?.photoUrl,
          "createAt":
              userCredential?.user?.metadata.creationTime?.toIso8601String(),
          "lastSignInTime":
              userCredential?.user?.metadata.lastSignInTime?.toIso8601String(),
        });
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

  Future<void> adminLogin(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (email == "admin@laporpky.com" && password == "admin112") {
        Get.offAllNamed(RouteName.HomeAdmin);
      } else {
        Get.defaultDialog(
          title: "Maaf",
          middleText: "Anda bukan admin",
        );
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
}

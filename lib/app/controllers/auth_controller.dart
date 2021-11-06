import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sfire/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  // Stream<User?> streamAuthStatus() {
  //   return auth.authStateChanges();
  // }

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void loginWithOTP(String otp, String verifId) async {
    try {
      PhoneAuthCredential myCredential = await PhoneAuthProvider.credential(
        verificationId: verifId,
        smsCode: otp,
      );
      await auth.signInWithCredential(myCredential);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      print(e.toString());
    }
  }

  void loginPhone(String phone) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential) {
        print("Phone Auth Credential".toUpperCase());
        print("=====================");
        print(PhoneAuthCredential);
        print("=====================");
      },
      verificationFailed: (error) => Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: error.message!,
      ),
      codeSent: (verificationId, int? resendToken) {
        print("codeSent".toUpperCase());
        print("verificationId");
        print(verificationId);
        print("______________________");
        print("Resend Token");
        print(resendToken);
        print("======================");
        Get.toNamed(Routes.OTP, arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("codeAutoRetrievalTimeout".toUpperCase());
        print("verificationId");
        print(verificationId);
        print("=====================");
      },
    );
  }

  Future<void> loginAnonimous() async {
    try {
      UserCredential myUser = await auth.signInAnonymously();
      print(myUser);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      print(e.toString());
    }
  }

  void resetPassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Reset password telah dikirimkan ke $email.",
          onConfirm: () {
            Get.back(); // close dialog
            Get.back(); // go to login
          },
          textConfirm: "Ya, Saya mengerti",
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak dapat mengirimkan reset password.",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Email tidak valid.",
      );
    }
  }

  void signup(String email, String password) async {
    try {
      UserCredential myUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await myUser.user!.sendEmailVerification();
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
            title: "Verification Email",
            middleText: "Kami telah mengirimkan email verifikasi ke $email.",
            onConfirm: () {
              Get.back(); //close dialog
              Get.back(); // go to login
            },
            textConfirm: "Ya, Saya akan cek email.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "The password provided is too weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "The account already exists for that email.",
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak dapat mendaftarkan akun ini.",
      );
    }
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Verification Email",
          middleText:
              "Anda perlu verifikasi email yang valid terlebih dahulu. Atau kirim ulang verifikasi",
          onConfirm: () async {
            await myUser.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: "Kirim Ulang",
          textCancel: "Kembali",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "No user found for that email.",
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Wrong password provided for that user.",
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak dapat login dengan akun ini.",
      );
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}

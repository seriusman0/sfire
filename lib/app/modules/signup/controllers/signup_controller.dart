import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController emailC =
      TextEditingController(text: "seriusman0@gmail.com");
  TextEditingController passC = TextEditingController(text: "serius");

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
  }
}

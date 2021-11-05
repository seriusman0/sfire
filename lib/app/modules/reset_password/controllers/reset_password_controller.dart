import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  TextEditingController emailC =
      TextEditingController(text: "seriusman0@gmail.com");

  

  @override
  void onClose() {
    emailC.dispose();
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController emailC =
      TextEditingController(text: "seriusman0@gmail.com");
  TextEditingController passC = TextEditingController(text: "serius");
  TextEditingController phoneC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    phoneC.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  TextEditingController otpC = TextEditingController();

  @override
  void onClose() {
    otpC.dispose();
  }
}

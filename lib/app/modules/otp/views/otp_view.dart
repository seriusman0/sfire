import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sfire/app/controllers/auth_controller.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OtpView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(children: <Widget>[
          TextField(
            controller: controller.otpC,
            decoration: InputDecoration(labelText: "OTP"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () => authC.loginWithOTP(
                    controller.otpC.text,
                    Get.arguments.toString(),
                  ),
              child: Text("Login")),
        ]),
      ),
    );
  }
}

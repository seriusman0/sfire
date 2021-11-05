import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfire/app/controllers/auth_controller.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller.emailC,
              decoration: InputDecoration(labelText: "Email"),
            ),
            ElevatedButton(
                onPressed: () => authC.resetPassword(controller.emailC.text),
                child: Text("RESET")),
            SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah Punya Akun ? "),
                TextButton(onPressed: () => Get.back(), child: Text("Login"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

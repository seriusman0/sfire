import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sfire/app/controllers/auth_controller.dart';
import '../../../../app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => authC.logout(), icon: Icon(Icons.logout))
        ],
      ),
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //   future: controller.getData(),
      //   builder: (context, snapshot) {
      //     var listAllDocs = snapshot.data!.docs;
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return ListView.builder(
      //           itemCount: listAllDocs.length,
      //           itemBuilder: (content, index) => ListTile(
      //                 title: Text(
      //                     "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}"),
      //                 subtitle: Text(
      //                     "Rp ${(listAllDocs[index].data() as Map<String, dynamic>)["price"]}"),
      //               ));
      //     }
      //     return Center(child: CircularProgressIndicator());
      //   },
      // ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          var listAllDocs = snapshot.data!.docs;
          if (snapshot.connectionState == ConnectionState.active) {
            return ListView.builder(
                itemCount: listAllDocs.length,
                itemBuilder: (content, index) => ListTile(
                      title: Text(
                          "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}"),
                      subtitle: Text(
                          "Rp ${(listAllDocs[index].data() as Map<String, dynamic>)["price"]}"),
                    ));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sfire/app/data/models/movie_model.dart';
import 'package:sfire/app/routes/app_pages.dart';

import '../controllers/movie_controller.dart';

class MovieView extends GetView<MovieController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ALL MOVIES'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Get.toNamed(Routes.ADD_MOVIE),
                icon: Icon(Icons.add))
          ],
        ),
        body: StreamBuilder<QuerySnapshot<Movie>>(
          stream: controller.streamMovie(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var listAllDocs = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: listAllDocs?.length,
                  itemBuilder: (content, index) => ListTile(
                        title: Text(
                            "${(listAllDocs?[index].data() as Map<String, dynamic>)["name"]}"),
                        subtitle: Text(
                            "Rp ${(listAllDocs?[index].data() as Map<String, dynamic>)["price"]}"),
                      ));
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}

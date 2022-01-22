import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_movie_controller.dart';

class AddMovieView extends GetView<AddMovieController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddMovieView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddMovieView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

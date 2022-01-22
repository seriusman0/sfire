import 'package:get/get.dart';

import '../controllers/add_movie_controller.dart';

class AddMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMovieController>(
      () => AddMovieController(),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfire/app/data/models/movie_model.dart';

class MovieController extends GetxController {
  final movieRef = FirebaseFirestore.instance
      .collection("movies")
      .withConverter<Movie>(
          fromFirestore: (snapshot, options) =>
              Movie.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson());

  Stream<QuerySnapshot<Movie>> streamMovie() {
    return movieRef.snapshots();
  }
}

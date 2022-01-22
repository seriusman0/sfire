import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QueryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void filter(int age) async {
    final results = await firestore
        .collection("users")
        .orderBy("name")
        .orderBy("age", descending: true)
        .limitToLast(1)
        .get();

    print(results.docs.length);
    if (results.docs.length > 0) {
      print("Total data filter : ${results.docs.length}");
      results.docs.forEach((element) {
        var id = element.id;
        var data = element.data()["name"];

        print("ID : $id");
        print("Data: $data");
      });
    } else {
      print("Tidak ada data pada filter ini");
    }
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/query_controller.dart';

class QueryView extends GetView<QueryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QueryView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => controller.filter(20),
          child: Text(
            'FILTER',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:learn_prompt/core.dart';
import '../controller/test2_controller.dart';

class Test2View extends StatefulWidget {
  int nomor;
  Test2View({Key? key, required this.nomor}) : super(key: key);

  Widget build(context, Test2Controller controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Test2"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<Test2View> createState() => Test2Controller();
}

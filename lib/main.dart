import 'package:learn_prompt/core.dart';
import 'package:learn_prompt/state_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    navigatorKey:
    Get.navigatorKey;
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: TestView());
  }
}

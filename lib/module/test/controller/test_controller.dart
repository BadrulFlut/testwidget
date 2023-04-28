import 'package:flutter/material.dart';
import 'package:learn_prompt/state_util.dart';
import '../view/test_view.dart';

class TestController extends State<TestView> implements MvcController {
  static late TestController instance;
  late TestView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool isLoading = false;

  void startLoading() {
    setState(() {
      isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      isLoading = false;
    });
  }

  void performLoading() async {
    startLoading();

    await Future.delayed(Duration(seconds: 5));

    stopLoading();
  }
}

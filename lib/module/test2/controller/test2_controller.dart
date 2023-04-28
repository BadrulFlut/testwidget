import 'package:flutter/material.dart';
import 'package:learn_prompt/state_util.dart';
import '../view/test2_view.dart';

class Test2Controller extends State<Test2View> implements MvcController {
  static late Test2Controller instance;
  late Test2View view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

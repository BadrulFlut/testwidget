import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learn_prompt/state_util.dart';
import '../view/home_view.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  var nama = '';
  var job = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  createData() async {
    var response = await Dio().post(
      "https://reqres.in/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "name": nameController.text,
        "job": jobController.text,
      },
    );
    if (response.statusCode == 201) {
      Map obj = response.data;
      nama = obj['name'];
      job = obj['job'];
    } else {
      throw Exception('Gagal membuat data');
    }
    setState(() {});
  }
}

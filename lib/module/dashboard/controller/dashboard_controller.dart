import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learn_prompt/state_util.dart';
import '../view/dashboard_view.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    getdata();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List users = [];

  getdata() async {
    var response = await Dio().get(
      "https://reqres.in/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      Map obj = response.data;
      users = obj["data"];
    } else {
      throw Exception('Tidak ada data');
    }
    setState(() {});
  }
}

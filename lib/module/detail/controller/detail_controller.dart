import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learn_prompt/state_util.dart';
import '../view/detail_view.dart';

class DetailController extends State<DetailView> implements MvcController {
  static late DetailController instance;
  late DetailView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  var idUsers = 0;
  var firstName = '';
  var lastName = '';
  var email = '';
  var avatar = '';
  var descriptions = '';

  getDetailUsers(int id) async {
    var response = await Dio().get(
      "https://reqres.in/api/users/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    if (mounted) {
      setState(() {
        if (response.statusCode == 200) {
          Map obj = response.data;
          idUsers = obj['data']['id'];
          firstName = obj['data']['first_name'];
          lastName = obj['data']['last_name'];
          email = obj['data']['email'];
          avatar = obj['data']['avatar'];
          descriptions = obj['support']['text'];
        } else {
          throw Exception('Tidak ada data');
        }
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:learn_prompt/core.dart';
import '../controller/detail_controller.dart';

class DetailView extends StatefulWidget {
  int id;
  DetailView({Key? key, required this.id}) : super(key: key);

  Widget build(context, DetailController controller) {
    controller.view = this;
    controller.getDetailUsers(id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
        centerTitle: true,
      ),
      body: controller.avatar == ''
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  controller.avatar,
                ),
              ),
              title: Text(controller.firstName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.email),
                  Text(controller.descriptions)
                ],
              ),
            ),
    );
  }

  @override
  State<DetailView> createState() => DetailController();
}

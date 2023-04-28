import 'package:flutter/material.dart';
import 'package:learn_prompt/core.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Create data'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: TextFormField(
                controller: controller.jobController,
                decoration: const InputDecoration(
                  labelText: 'Job',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                controller.createData();
              },
              child: const Text("Create"),
            ),
            const SizedBox(
              height: 50,
            ),
            controller.nama == ''
                ? const Text('')
                : Card(
                    child: ListTile(
                      title: Text(controller.nama),
                      subtitle: Text(controller.job),
                    ),
                  ),
          ],
        ));
  }

  @override
  State<HomeView> createState() => HomeController();
}

import 'package:flutter/material.dart';
import 'package:learn_prompt/core.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;
    return Scaffold(
      body: controller.users.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (context, index) {
                var user = controller.users[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailView(id: user['id'])));
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          user['avatar'],
                        ),
                      ),
                      title: Text(user['first_name']),
                      subtitle: Text(user['email']),
                    ),
                  ),
                );
              },
            ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}

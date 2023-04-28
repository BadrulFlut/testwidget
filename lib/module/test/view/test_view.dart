import 'package:flutter/material.dart';
import 'package:learn_prompt/core.dart';
import '../controller/test_controller.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  Widget build(context, TestController controller) {
    controller.view = this;
    print(controller.isLoading);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Test"),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () async {
                await showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text('Are you sure you want to delete this item?'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[600],
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Keluar"),
            ),
          ],
        ),
        body: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: InkWell(
                  onTap: () {
                    controller.performLoading();
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://i.ibb.co/dGcQ5bw/photo-1549692520-acc6669e2f0c-ixlib-rb-1-2.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        "PRODUCTIVITY",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "3 days ago",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  const Text(
                                    "7 Skills of Highly Effective Programmers",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
  }

  @override
  State<TestView> createState() => TestController();
}

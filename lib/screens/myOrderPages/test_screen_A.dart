import 'package:flutter/material.dart';

class TestScreenA extends StatelessWidget {
     const TestScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 572,
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                  leading: const Icon(Icons.list),
                  trailing: const Text(
                    "tP",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text("Pending Orders $index")),
            );
          }),
    );
  }

}
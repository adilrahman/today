import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditItemPage extends StatelessWidget {
  const EditItemPage({Key? key, required this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.edit),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //deleting the post
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Title",
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Description"),
              maxLines: 20,
              keyboardType: TextInputType.multiline,
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.update),
                label: const Text("UPDATE"))
          ],
        ),
      ),
    );
  }
}

import 'dart:html';

import 'package:flutter/material.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Icon(Icons.today_outlined),
          centerTitle: true,
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
                  icon: const Icon(Icons.add_circle_outline),
                  label: const Text("Note"))
            ],
          ),
        ),
      ),
    );
  }
}

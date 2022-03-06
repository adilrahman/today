import 'dart:html';

import 'package:flutter/material.dart';
import 'package:today/functions/db_functions.dart';
import 'package:today/model/data_model.dart';

class AddItemScreen extends StatelessWidget {
  AddItemScreen({Key? key}) : super(key: key);

  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController =
      TextEditingController();

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
              TextField(
                // Title field
                controller: _titleEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Title",
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                // descriton field
                controller: _descriptionEditingController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Description"),
                maxLines: 20,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                  // add button
                  onPressed: () {
                    onAddBtnClicked();
                  },
                  icon: const Icon(Icons.add_circle_outline),
                  label: const Text("Note"))
            ],
          ),
        ),
      ),
    );
  }

  onAddBtnClicked() {
    String? _title = _titleEditingController.text;
    String? _description = _descriptionEditingController.text;
    if (_description.isEmpty || _title.isEmpty) {
      return;
    } else {
      //add to the database
      addItemToDB(ItemModel(title: _title, description: _description));
    }
  }
}

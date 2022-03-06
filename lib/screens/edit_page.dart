import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today/functions/db_functions.dart';
import 'package:today/model/data_model.dart';

class EditItemPage extends StatelessWidget {
  EditItemPage({Key? key, required ItemModel this.item}) : super(key: key);

  final ItemModel item;

  TextEditingController _newTitleController = TextEditingController();
  TextEditingController _newDescrptionController = TextEditingController();

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
                deleteTheItem(item.key!);
                getAllItems();
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _newTitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "${item.title}",
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _newDescrptionController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "${item.description}"),
              maxLines: 20,
              keyboardType: TextInputType.multiline,
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
                // update button
                onPressed: () {
                  onClickUpdateBtn(context);
                },
                icon: const Icon(Icons.update),
                label: const Text("UPDATE"))
          ],
        ),
      ),
    );
  }

  onClickUpdateBtn(BuildContext context) async {
    String? _title = _newTitleController.text;
    String? _descrition = _newDescrptionController.text;
    if (_title.isEmpty && _descrition.isEmpty) {
      return;
    }
    item.title = (_title.isEmpty ? item.title : _title);
    item.description = (_descrition.isEmpty ? item.description : _descrition);
    updateItem(item);
    build(context);
  }
}

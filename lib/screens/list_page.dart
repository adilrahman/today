import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:today/functions/db_functions.dart';
import 'package:today/model/data_model.dart';
import 'package:today/screens/edit_page.dart';
import 'package:today/widgets/detailedViewSheet.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllItems();
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.list_alt_sharp),
        centerTitle: true,
      ),
      body: (itemsListNotifier.value.length == 0
          ? Center(
              child: Text("No Items Yet !!"),
            )
          : Container(
              child: ValueListenableBuilder(
                valueListenable: itemsListNotifier,
                builder: (BuildContext context, List<ItemModel> itemList,
                    Widget? child) {
                  return ListView.separated(
                      itemBuilder: (BuildContext ctx, int index) {
                        var _item = itemList[index];

                        return GFListTile(
                          avatar: (_item.isCompleted
                              ? Icon(
                                  // task completed icons
                                  Icons.done,
                                  color: Colors.green,
                                )
                              : Icon(
                                  // task completed icons
                                  Icons.add_task_rounded,
                                )),
                          titleText: _item.title,
                          subTitleText: (_item.description.length < 120
                              ? _item.description
                              : _item.description.substring(1, 123) + "....."),
                          icon: const Icon(Icons.keyboard_arrow_right),
                          hoverColor: Colors.blue[50],
                          padding: const EdgeInsets.all(10),
                          focusColor: Colors.yellow,
                          onTap: () {
                            // Going to the edit page
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return EditItemPage(
                                item: _item,
                              );
                            }));
                          },
                          onLongPress: () {
                            // Showing the descriptions and Title only
                            // and also can mark as done the task
                            showDetailedViewofTask(context, _item);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext ctx, int index) =>
                          const Divider(),
                      itemCount: itemsListNotifier.value.length);
                },
              ),
            )),
    );
  }
}

// ListTile(
//                 title: Text("$index wake up early asap"),
//                 leading: Icon(Icons.add_task_rounded),
//                 subtitle: Text("you can do it"),
//                 trailing: Icon(Icons.keyboard_arrow_right),
//                 onTap: () {
//                   print("$index"); // Going to the edit page
//                 },
//                 onLongPress: () {
//                   // Showing the descriptions and Title only no edit options
//                 },
//               );

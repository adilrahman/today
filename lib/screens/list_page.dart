import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:today/screens/edit_page.dart';
import 'package:today/widgets/detailedViewSheet.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.list_alt_sharp),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.separated(
            itemBuilder: (BuildContext ctx, int index) {
              return GFListTile(
                avatar: const Icon(Icons.add_task_rounded),
                titleText: "Title $index",
                subTitleText: "subtitle",
                icon: const Icon(Icons.keyboard_arrow_right),
                hoverColor: Colors.blue[50],
                padding: const EdgeInsets.all(10),
                focusColor: Colors.yellow,
                onTap: () {
                  // Going to the edit page
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return EditItemPage(data: 1);
                  }));
                },
                onLongPress: () {
                  // Showing the descriptions and Title only no edit options
                  showDetailedViewofTask(context, index);
                },
              );
            },
            separatorBuilder: (BuildContext ctx, int index) => Divider(),
            itemCount: 30),
      ),
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
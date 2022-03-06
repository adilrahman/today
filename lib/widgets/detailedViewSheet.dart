import 'package:flutter/material.dart';

showDetailedViewofTask(BuildContext ctx, int key) async {
  showModalBottomSheet(
      context: ctx,
      builder: (ctx) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Title",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                      "description description description description description\ndescriptiondescriptiondescription"),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.done),
                          label: Text("done")),
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.cancel),
                          label: Text("cancel")),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}

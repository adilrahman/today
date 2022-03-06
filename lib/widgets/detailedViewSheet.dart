import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today/functions/db_functions.dart';
import 'package:today/model/data_model.dart';

showDetailedViewofTask(BuildContext ctx, ItemModel item) async {
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
                    child: Visibility(
                        visible: item.isCompleted,
                        child: AvatarGlow(
                          endRadius: 1000,
                          showTwoGlows: false,
                          animate: true,
                          glowColor: Colors.green,
                          child: Icon(
                            Icons.done_outline_rounded,
                            color: Colors.green,
                          ),
                        ))),
                Expanded(
                  flex: 1,
                  child: Text(
                    item.title,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(item.description),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        // done button
                        onPressed: () {
                          taskCompleted(item);
                        },
                        icon: Icon(
                          Icons.done,
                        ),
                        label: const Text("done"),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          icon: const Icon(Icons.cancel),
                          label: const Text("cancel")),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}

taskCompleted(ItemModel item) async {
  if (item.isCompleted == true) {
    return;
  }
  markAsCompleted(item);
}

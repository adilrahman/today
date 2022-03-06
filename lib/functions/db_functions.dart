import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:today/model/data_model.dart';

ValueNotifier<List<ItemModel>> itemsListNotifier = ValueNotifier([]);

addItemToDB(ItemModel item) async {
  final _itemsDB = await Hive.openBox<ItemModel>("items_db");
  int _key = await _itemsDB.add(item);
  item.key = _key;
  await _itemsDB.put(_key, item);
  itemsListNotifier.value.add(item);
  itemsListNotifier.notifyListeners();
}

getAllItems() async {
  final _itemsDB = await Hive.openBox<ItemModel>("items_db");
  itemsListNotifier.value.clear();
  itemsListNotifier.value.addAll(_itemsDB.values);
  itemsListNotifier.notifyListeners();
}

markAsCompleted(ItemModel item) async {
  final _itemsDB = await Hive.openBox<ItemModel>("items_db");
  item.isCompleted = true;
  await _itemsDB.put(item.key, item);
  itemsListNotifier.notifyListeners();
}

deleteTheItem(int key) async {
  final _itemsDB = await Hive.openBox<ItemModel>("items_db");
  await _itemsDB.delete(key);
  itemsListNotifier.notifyListeners();
}

updateItem(ItemModel item) async {
  final _itemsDB = await Hive.openBox<ItemModel>("items_db");
  await _itemsDB.put(item.key, item);
  itemsListNotifier.notifyListeners();
}

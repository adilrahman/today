import 'package:flutter/material.dart';

BottomNavigationBar bottomNavBar() {
  return BottomNavigationBar(items: const [
    BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Edit"),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: "List")
  ]);
}

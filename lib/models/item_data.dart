import 'dart:convert';
import 'package:app/models/item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemData with ChangeNotifier {
  static SharedPreferences? _sharedPreferences;
  List<Item> items = [];
  void toggleChanged(int index) {
    items[index].toggleItem();
    saveData(items);
    notifyListeners();
  }

  List<String> itemAsString = [];
  void addItem(String newDeger) {
    items.add(
      Item(title: newDeger),
    );
    saveData(items);
    notifyListeners();
  }

  void delete(int index) {
    items.removeAt(index);
    saveData(items);
    notifyListeners();
  }

  Future<void> crateShare() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveData(List<Item> items) {
    itemAsString.clear();
    for (var item in items) {
      itemAsString.add(jsonEncode(item.toMap()));
    }
    _sharedPreferences!.setStringList('toDoList', itemAsString);
  }

  void loadData() {
    List<String> geciciListe =
        _sharedPreferences!.getStringList('toDoList') ?? [];
    items.clear();
    for (var item in geciciListe) {
      items.add(Item.fromMap(jsonDecode(item)));
    }
  }
}

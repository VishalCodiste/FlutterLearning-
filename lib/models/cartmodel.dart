import 'dart:convert';
import 'dart:ffi';

import 'package:flutterlearning/models/catelogModel.dart';

class Cartmodel {
  CatelogModel _catelog = CatelogModel(); // Provide an initializer expression

  final List<String> _itemIds = [];

  Cartmodel(CatelogModel catelogModel);

  CatelogModel get catelog => _catelog; // Provide an initializer expression

  set catelog(CatelogModel newcatelog) {
    _catelog = newcatelog;
  }

  List<Item> get items => _itemIds.map((id) => _catelog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

  void add(Item item) {
    print("Add : ${item.name}");
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

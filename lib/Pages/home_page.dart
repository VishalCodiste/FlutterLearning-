import 'package:flutter/material.dart';
import 'package:flutterlearning/models/catelog.dart';
import 'package:flutterlearning/widgets/drawer.dart';
import 'package:flutterlearning/widgets/item_Widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int day = 2;
    final String name = "Vishal";

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.5,
        // iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          "home page",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: CatalogModel.items[index]);
        },
      ),
      drawer: MyDrawer(),
    );
  }
}

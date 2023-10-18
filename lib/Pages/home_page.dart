import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutterlearning/models/catelogModel.dart';
import 'package:flutterlearning/models/utils/routs.dart';
import 'package:flutterlearning/widgets/drawer.dart';
import 'package:flutterlearning/widgets/gridItem_Widget.dart';
// import 'package:flutterlearning/widgets/item_Widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catelogJson =
        await rootBundle.loadString("assets/files/catelog.json");
    final decodeData = jsonDecode(catelogJson);
    var productsData = decodeData["products"];

    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});

    // List<Item> items = [];
    // for (var product in productsData) {
    //   Item item = Item(
    //     id: product["id"],
    //     name: product["name"],
    //     desc: product["desc"],
    //     price: product["price"],
    //     color: product["color"],
    //     imageUrl: product["imageUrl"],
    //   );
    //   items.add(item);
    //   CatalogModel.items = items;
    // setState(() {});
    // }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRouts.cartPage);
          },
          backgroundColor: Colors.deepPurple,
          child: const Icon(CupertinoIcons.cart)),
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.5,
        // iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        //     ? ListView.builder(
        //         itemCount: CatalogModel.items.length,
        //         itemBuilder: (context, index) {
        //           return ItemWidget(item: CatalogModel.items[index]);
        //         },
        //       )
        //     : const Center(
        //         child: CircularProgressIndicator(),
        //       ),

        child: (CatelogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final item = CatelogModel.getByPosition(index);
                  return gridItemWidget(item: item);
                },
                itemCount: CatelogModel.items.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}

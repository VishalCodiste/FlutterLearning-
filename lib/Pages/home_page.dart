import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlearning/models/cartmodel.dart';

import 'package:flutterlearning/models/catelogModel.dart';
import 'package:flutterlearning/pages/cart_page.dart';
import 'package:flutterlearning/widgets/drawer.dart';
import 'package:flutterlearning/widgets/gridItem_Widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Cartmodel objCart = Cartmodel(CatelogModel());
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    //   File
    final catelogJson = await rootBundle.loadString("assets/files/catelog.json");

    // //  API
    // final response = await http.get(Uri.parse(url));
    // final catelogJson = response.body;

    final decodeData = jsonDecode(catelogJson);
    var productsData = decodeData["products"];

    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    for (int i = 0; i < 3; i++) {
      objCart.add(CatelogModel.items[i]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(objCart),
            ),
          );
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(CupertinoIcons.cart),
      ),
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
                  final item = CatelogModel.items[index];
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

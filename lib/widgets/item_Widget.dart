import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterlearning/models/catelog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    num price = item.price;

    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.imageUrl),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$$price",
          textScaleFactor: 1.2,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

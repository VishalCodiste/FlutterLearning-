import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final int day = 2;
final String name = "Vishal";


    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to fultter App Day $day With $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}

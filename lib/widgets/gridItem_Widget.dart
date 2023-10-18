import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterlearning/models/catelogModel.dart';
import 'package:flutterlearning/models/catelogModel.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class gridItemWidget extends StatelessWidget {
  final Item item;

  const gridItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    num price = item.price;

    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: GridTile(
            header: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(item.name)),
            // ignore: sort_child_properties_last
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Image.network(item.imageUrl)),
            footer: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    "\$ ${item.price}",
                    textScaleFactor: 1.2,
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 35,
                    width: 75,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your action when the button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              17.5), // Adjust the radius as needed
                        ),
                      ),
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}


//  child: Column(
//             children: [
//               Container(
//                 child: Padding(
//                     padding: const EdgeInsets.only(left: 8),
//                     child: Text(item.name)),
//               ),
//               Container(
//                 height: 100,
//                 width: 100,
//                 child: Image.network(item.imageUrl)),
//               Container(child: 
//               Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Text(
//                     "\$ ${item.price}",
//                     textScaleFactor: 1.2,
//                     style: const TextStyle(
//                       color: Colors.deepPurple,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Spacer(),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Add your action when the button is pressed
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           10.0), // Adjust the radius as needed
//                     ),
//                   ),
//                   child: const Text("Buy Now"),
//                 ),
//               ],
//             ),
//               ,)
//             ],
//           ),

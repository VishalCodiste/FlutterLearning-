import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.black),
      ));

  // static ThemeData get darkTheme => ThemeData(
  //     primarySwatch: Colors.deepPurple,
  //     fontFamily: GoogleFonts.lato().fontFamily,
  //     appBarTheme: const AppBarTheme(
  //       color: Colors.black,
  //       elevation: 0.5,
  //       iconTheme: IconThemeData(color: Colors.white),
  //     ));
}

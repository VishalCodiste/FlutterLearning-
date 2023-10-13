import 'package:flutter/material.dart';
import 'package:flutterlearning/utils/routs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/login_page.dart'; // Adjust the path as needed
import 'Pages/home_page.dart'; // Adjust the path as needed

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        ),
      routes: {
        "/": (context) => LoginPage(),
        MyRouts.homePage: (context) => HomePage(),
        MyRouts.loginPage: (context) => LoginPage(),
      },
    );
  }
}
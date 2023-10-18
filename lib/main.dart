import 'package:flutter/material.dart';
import 'package:flutterlearning/Widgets/Themes.dart';
import 'package:flutterlearning/pages/cart_page.dart';
import 'package:flutterlearning/utils/routes.dart';
import 'pages/login_page.dart'; // Adjust the path as needed
import 'pages/home_page.dart'; // Adjust the path as needed

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      initialRoute: MyRoutes.homePage,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homePage: (context) => HomePage(),
        MyRoutes.loginPage: (context) => LoginPage(),
        // MyRoutes.cartPage: (context) => Cartpage(),
      },
    );
  }
}

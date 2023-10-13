// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutterlearning/utils/routs.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset(
              "assets/images/login_Screen.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter username", labelText: "Username"),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRouts.homePage);
                      },
                      child: const Text("Login"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

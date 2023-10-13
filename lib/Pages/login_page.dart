// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutterlearning/utils/routs.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeLoginBtn = false;

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
            Text(
              "Welcome $name",
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
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                  ),
                  const SizedBox(height: 30),

                  InkWell(
                    hoverColor: Colors.white,
                    onTap: () async {
                      setState(() {
                        changeLoginBtn = true;
                      });
                      
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRouts.homePage);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeLoginBtn ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changeLoginBtn ? 25 : 8),
                      ),
                      child: changeLoginBtn
                          ? const Icon(Icons.done, color: Colors.white)
                          : const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                    ),
                  )
                  // ElevatedButton(
                  //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRouts.homePage);
                  //   },
                  //   child: const Text("Login")
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

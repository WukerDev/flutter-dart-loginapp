import 'package:flutter/material.dart';
import 'package:todolist/Model/usermanager.dart';
import 'package:todolist/Screens/RegisterPage.dart';
import 'package:todolist/Screens/ToDoPage.dart';

import '../Model/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_box,
            size: 80,
            color: Colors.blue[700],
          ),
          Center(
            child: Text("Login",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Segoe UI',
                )),
          ), //LOGIN
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextField(
              controller: login,
              decoration: InputDecoration(
                labelText: "Login",
                border: OutlineInputBorder(),
              ),
            ),
          ), //INPUT_LOGIN
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
          ), //INPUT_PASSWORD
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SizedBox(
              width: 150,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  User user = UserManager.findUser(login.text, password.text);
                  if (user.id == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Login or password is incorrect"),
                      duration: const Duration(seconds: 1),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Successfully logged in!\nWitaj ${user.name}"),
                      duration: const Duration(seconds: 1),
                    ));
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ToDoPage()));
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ), //BUTTON_LOGIN
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SizedBox(
              width: 150,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ), //BUTTON_LOGIN
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todolist/Model/usermanager.dart';

import '../Model/user.dart';
import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
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
            child: Text("Register",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Segoe UI',
                )),
          ), //loginController
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Your name",
                border: OutlineInputBorder(),
              ),
            ),
          ), //nameController
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextField(
              controller: loginController,
              decoration: InputDecoration(
                labelText: "Login",
                border: OutlineInputBorder(),
              ),
            ),
          ), //INPUT_loginController
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
          ), //INPUT_passwordController
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextField(
              controller: passwordController2,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Repeat password",
                border: OutlineInputBorder(),
              ),
            ),
          ), //INPUT_passwordController
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SizedBox(
              width: 150,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  if (passwordController.text == passwordController2.text) {
                    addUser(nameController.text, loginController.text,
                        passwordController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Registered successfully!"),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Passwords don't match."),
                      ),
                    );
                  }
                },
                child: Text("Register",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: 22,
                    )),
              ),
            ),
          ) //BUTTON_loginController
        ],
      ),
    );
  }

  void addUser(String name, String login, String password) {
    setState(() {
      UserManager.users.add(User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        login: login,
        password: password,
      ));
    });
  }
}

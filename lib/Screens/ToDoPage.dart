import 'package:flutter/material.dart';

import '../Model/usermanager.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<StatefulWidget> createState() => ToDoState();
}

class ToDoState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Witaj, ${UserManager.loggedUser!.login}")),
        body: ListView(
          children: [
            ToDoTile(),
            ToDoTile(),
            ToDoTile(),
            ToDoTile(),
            ToDoTile(),
          ],
        ));
  }
}

class ToDoTile extends StatelessWidget {
  const ToDoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Checkbox(value: false, onChanged: onChanged),
              Text("Task name:"),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  void onChanged(bool? value) {}
}

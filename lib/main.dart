import 'package:flutter/material.dart';
import 'package:todolist/Screens/LoginPage.dart';
import 'package:todolist/Screens/RegisterPage.dart';
import 'package:todolist/Screens/ToDoPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'TODOList',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.blue[50],
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.blue[700], displayColor: Colors.blue[600])),
      // A widget which will be started on application startup
      home: const RegisterPage(),
    );
  }
}

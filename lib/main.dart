import 'package:flutter/material.dart';
import 'package:taaki/mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Taaki',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.amber
      ),
      home: new MainPage(title: 'QR Data Scanner'),
    );
  }
}

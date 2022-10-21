import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemple Statefulll',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetStatefull(),
    );
  }
}

class WidgetStatefull extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetStatefull();
  }
}

class _WidgetStatefull extends State<WidgetStatefull> {
  String _displayedtext = "face";

  IconData? _icon = Icons.face_outlined;

  bool face = true;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(title: Text("statefull widget")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_displayedtext),
            IconButton(onPressed: onPressed, icon: Icon(_icon))
          ],
        ))));
  }

  void onPressed() {
    setState(() {
      if (face) {
        _displayedtext = "favourite";
        _icon = Icons.favorite;
        face = false;
      } else {
        _displayedtext = "face";
        _icon = Icons.face_outlined;
        face = true;
      }
    });
  }
}

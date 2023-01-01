import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Flutter app",
          ),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(
          title: Text(
            "List",
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            "List",
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            "List",
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            "List",
          ),
        ),
        Divider(),
      ],
    );
  }
}

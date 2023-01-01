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
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.assignment),
          title: Text(
            "啥东西",
          ),
          subtitle: Text(
            "啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西啥东西",
          ),
        ),
        Divider(),
      ],
    );
  }
}

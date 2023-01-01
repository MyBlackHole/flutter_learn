import 'package:flutter/material.dart';
import './font.dart';

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
    return Column(
      children: const [
        SizedBox(
          height: 20,
        ),
        Icon(
          Icons.bluetooth,
        ),
        SizedBox(
          height: 20,
        ),
        Icon(
          Icons.settings,
        ),
        SizedBox(
          height: 20,
        ),
        Icon(
          Icons.search,
          size: 20,
          color: Colors.yellow,
        ),
        SizedBox(
          height: 20,
        ),
        Icon(
          MFont.chifan,
          size: 40,
          color: Colors.orange,
        ),
      ],
    );
  }
}

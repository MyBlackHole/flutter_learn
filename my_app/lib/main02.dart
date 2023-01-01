import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Black"),
      ),
      body: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Black Hole",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.red,
          fontSize: 40,
        ),
      ),
    );
  }
}

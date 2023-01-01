import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Black"),
      ),
      body: const Center(
        child: Text(
          "Black Hole",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.red,
            fontSize: 40,
          ),
        ),
      ),
    ),
  ));
}

// void main(List<String> args) {
//   runApp(const Center(
//     child: Text(
//       "Black Hole",
//       textDirection: TextDirection.ltr,
//       style: TextStyle(
//         color: Colors.red,
//         fontSize: 40,
//       ),
//     ),
//   ));
// }

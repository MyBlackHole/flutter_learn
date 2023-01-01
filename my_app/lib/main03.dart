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
    return Center(
      child: Container(
        alignment: Alignment.center, // 配置 Container 容器元素的方位
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.yellow, // 背景颜色
          border: Border.all(
            // 边框
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10), // 配置圆角、圆形
          boxShadow: const [
            // 配置阴影效果
            BoxShadow(
              color: Colors.blue,
              blurRadius: 20.0,
            ),
          ],
          // LinearGradient 背景线性渐变 RadialGradient 径向(中间向四周)渐变
          // gradient: const LinearGradient(
          //   colors: [
          //     Colors.red,
          //     Colors.yellow,
          //   ],
          // ),
          gradient: const RadialGradient(
            colors: [
              Colors.red,
              Colors.yellow,
            ],
          ),
        ),
        child: const Text(
          "Hole",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

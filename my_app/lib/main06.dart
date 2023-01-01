import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Black"),
      ),
      body: Column(
        children: const [
          MyApp(),
          SizedBox(
            height: 20,
          ),
          Circular(),
          SizedBox(
            height: 20,
          ),
          ClipImage(),
          SizedBox(
            height: 20,
          ),
          LoaclImage()
        ],
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 450,
        height: 450,
        decoration: const BoxDecoration(
          color: Colors.yellow,
        ),
        child: Image.network(
          "https://img0.baidu.com/it/u=191672387,4111662998&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800",
          // alignment: Alignment.centerLeft,
          // scale: 2, // 缩小
          // fit: BoxFit.cover,
          // repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }
}

// 圆形图片
class Circular extends StatelessWidget {
  const Circular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 350,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(75),
          image: const DecorationImage(
            image: NetworkImage(
              "https://img0.baidu.com/it/u=191672387,4111662998&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ClipImage extends StatelessWidget {
  const ClipImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        "https://img0.baidu.com/it/u=191672387,4111662998&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800",
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}

class LoaclImage extends StatelessWidget {
  const LoaclImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        color: Colors.yellow,
      ),
      child: Image.asset(
        "images/IMG_20220506_195625.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}

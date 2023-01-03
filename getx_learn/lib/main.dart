import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learn/controller.dart';

void main() {
  runApp(const GetMaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Demo'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.increment();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('snackbar'),
            onPressed: () {
              Get.snackbar(
                '标题', '网络异常',
                colorText: Colors.white,
                backgroundColor: Colors.black54,
                // 显示时间
                duration: const Duration(seconds: 1),
                snackPosition: SnackPosition.BOTTOM,
                titleText: const Text(
                  '标题',
                  style: TextStyle(color: Colors.red),
                ),
                messageText: Column(
                  // verticalDirection: VerticalDirection.up,
                  children: const [
                    Icon(Icons.add, color: Colors.white),
                    Icon(Icons.remove, color: Colors.white),
                    Icon(Icons.list, color: Colors.white),
                  ],
                ),
                icon: const Icon(
                  Icons.usb_rounded,
                  color: Colors.white,
                  size: 35,
                ),
                borderWidth: 2.0,
                borderColor: Colors.red,
              );
            },
          ),
          GestureDetector(
            onTap: () {
              Get.to(Other());
            },
            child: Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Obx(
                  () => Text(
                    controller.count.toString(),
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Other extends StatelessWidget {
  final Controller c = Get.find();

  Other({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Text("${c.count}"),
      ),
    );
  }
}

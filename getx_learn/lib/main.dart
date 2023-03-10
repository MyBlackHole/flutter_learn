import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learn/controller.dart';

void main() {
  runApp(GetMaterialApp(
    // home: Home(),
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => const Home()),
      GetPage(name: '/other', page: () => Other(), transition: Transition.zoom),
      GetPage(name: '/login', page: () => const Login()),
    ],
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Get.toNamed('/login');
              },
            ),
            ElevatedButton(
              child: const Text('bottomsheet'),
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: 300,
                    color: Colors.white,
                    child: ListView(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.restaurant),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          title: const Text('重启'),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        const ListTile(
                          title: Text('注销'),
                        ),
                        const ListTile(
                          title: Text('关机'),
                        ),
                      ],
                    ),
                  ),
                  enableDrag: false,
                  isDismissible: false,
                );
              },
            ),
            ElevatedButton(
              child: const Text('dialog'),
              onPressed: () {
                Get.defaultDialog(
                  title: '标题',
                  titleStyle: const TextStyle(color: Colors.red),
                  content: Column(
                    children: const [
                      Text('1'),
                      Text('2'),
                      Text('3'),
                      Text('4'),
                    ],
                  ),
                  cancel: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('取消'),
                  ),
                  confirm: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Get.back();
                      Get.snackbar('提示', '已确认');
                    },
                    child: const Text(
                      '确认',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  barrierDismissible: false,
                );
              },
            ),
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
                Get.toNamed('/other', arguments: {'name': 'black hole'});
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
        child: Text("${c.count} - - ${Get.arguments['name']}"),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text('登陆'),
        ),
      ),
    );
  }
}

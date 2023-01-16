import 'package:flutter/material.dart';
import 'package:iot_ui_challenge/model/device_model.dart';
import 'package:iot_ui_challenge/pages/home/widgets/devices.dart';
import 'package:iot_ui_challenge/utils/string_to_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DeviceModel> devices = [
    DeviceModel(
        token: 'FDF40316EA0438DF',
        name: '开',
        isActive: false,
        color: "#ff5f5f",
        clickColor: "#ffffff",
        icon: 'assets/svg/light.svg'),
    DeviceModel(
        token: 'FDF40316EA0138DF',
        name: '关',
        isActive: false,
        color: "#7739ff",
        clickColor: "#777777",
        icon: 'assets/svg/ac.svg'),
    DeviceModel(
        token: 'FDF40316EA0838DF',
        name: '锁',
        isActive: false,
        color: "#c9c306",
        clickColor: "#cccccc",
        icon: 'assets/svg/tv.svg'),
    DeviceModel(
        token: 'FDF40316EA0238DF',
        name: '解',
        isActive: false,
        color: "#c207db",
        clickColor: "#dddddd",
        icon: 'assets/svg/speaker.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    print("page");
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFFfce2e1), Colors.white]),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "卷闸门",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    // CircleAvatar(
                    //     minRadius: 16,
                    //     backgroundImage: AssetImage("assets/images/user.webp"))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: GridView.builder(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 3 / 4,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemCount: devices.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Devices(
                                  token: devices[index].token,
                                  name: devices[index].name,
                                  svg: devices[index].icon,
                                  color: devices[index].color.toColor(),
                                  isActive: devices[index].isActive,
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        devices[index].isActive = val;
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqttclient/mqtt_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MQTT Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter MQTT Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  MqttClient? client;
  var topic = "flutter/gate/1";

  void _publish(String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString('Hello from flutter_client');
    client?.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           ElevatedButton(
              child: const Text('Connect'),
              onPressed: () => {
                connect().then((value) {
                  client = value;
                })
              },
            ),
            ElevatedButton(
              child: const Text('Subscribe'),
              onPressed: () => {client?.subscribe(topic, MqttQos.atLeastOnce)},
            ),
            ElevatedButton(
              child: const Text('Publish'),
              onPressed: () => {_publish('Hello')},
            ),
            ElevatedButton(
              child: const Text('Unsubscribe'),
              onPressed: () => {client?.unsubscribe(topic)},
            ),
            ElevatedButton(
              child: const Text('Disconnect'),
              onPressed: () => {client?.disconnect()},
            ),
          ],
        ),
      ),
    );
  }
}

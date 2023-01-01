import 'package:flutter/foundation.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:io';

Future<MqttClient> connect() async {
  MqttServerClient client =
      MqttServerClient.withPort('42.192.22.176', 'flutter_client', 1883);
  client.logging(on: true);
  client.onConnected = onConnected;
  client.onDisconnected = onDisconnected;
  client.onUnsubscribed = onUnsubscribed;
  client.onSubscribed = onSubscribed;
  client.onSubscribeFail = onSubscribeFail;
  client.pongCallback = pong;

  final connMess = MqttConnectMessage()
      .withClientIdentifier("flutter_client")
      .authenticateAs("Black", "1358")
     // .keepAliveFor(60)
      .withWillTopic('will-topic')
      .withWillMessage('My Will message')
      .startClean()
      .withWillQos(MqttQos.atLeastOnce);
  client.connectionMessage = connMess;
  try {
    if (kDebugMode) {
      print('Connecting');
    }
    await client.connect();
  } catch (e) {
    if (kDebugMode) {
      print('Exception: $e');
    }
    client.disconnect();
  }

  if (client.connectionStatus?.state == MqttConnectionState.connected) {
    if (kDebugMode) {
      print('EMQX client connected');
    }
    client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      if (kDebugMode) {
        print('Received message:$payload from topic: ${c[0].topic}>');
      }
    });

    client.published?.listen((MqttPublishMessage message) {
      if (kDebugMode) {
        print('published');
      }
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);
      if (kDebugMode) {
        print(
          'Published message: $payload to topic: ${message.variableHeader?.topicName}');
      }
    });
  } else {
    if (kDebugMode) {
      print(
        'EMQX client connection failed - disconnecting, status is ${client.connectionStatus}');
    }
    client.disconnect();
    exit(-1);
  }

  return client;
}

void onConnected() {
  if (kDebugMode) {
    print('Connected');
  }
}

void onDisconnected() {
  if (kDebugMode) {
    print('Disconnected');
  }
}

void onSubscribed(String topic) {
  if (kDebugMode) {
    print('Subscribed topic: $topic');
  }
}

void onSubscribeFail(String topic) {
  if (kDebugMode) {
    print('Failed to subscribe topic: $topic');
  }
}

void onUnsubscribed(String? topic) {
  if (kDebugMode) {
    print('Unsubscribed topic: $topic');
  }
}

void pong() {
  if (kDebugMode) {
    print('Ping response client callback invoked');
  }
}

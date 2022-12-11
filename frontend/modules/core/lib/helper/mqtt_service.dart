import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService extends ChangeNotifier {
  final ValueNotifier<String> dataSalt = ValueNotifier<String>('');
  final ValueNotifier<String> dataTemp = ValueNotifier<String>('');

  late MqttServerClient client;

  Future<Object> connect() async {
    client = MqttServerClient.withPort(
        'broker.mqtt-dashboard.com', 'flutter_client', 1883);
    client.logging(on: true);
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;
    client.onUnsubscribed = onUnSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;
    client.keepAlivePeriod = 60;

    client.setProtocolV311();

    final connMess = MqttConnectMessage()
        .withWillTopic('willTopic')
        .withWillMessage('willMessage')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    print('MQTT_LOGS::Mosquitto client connecting....');

    client.connectionMessage = connMess;
    try {
      await client.connect();
    } catch (e) {
      print('$e');
      client.disconnect();
    }

    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      print('Client Connected');
    } else {
      print('Client Disconnected');
      client.disconnect();
      exit(-1);
    }

    // Subs
    const temp = 'topicName/temperature';
    client.subscribe(temp, MqttQos.atLeastOnce);

    const salt = 'topicName/salt';
    client.subscribe(salt, MqttQos.atLeastOnce);

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      //Salt

      final recMessTemp = c![0].payload as MqttPublishMessage;
      final ptTemp =
          MqttPublishPayload.bytesToStringAsString(recMessTemp.payload.message);

      dataTemp.value = ptTemp;

      notifyListeners();
      print(
          'MQTT_LOGS:: New data arrived: topic is <${c[0].topic}>, payload is $ptTemp');
      print('');

      // Temp
      final recMess = c[0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      dataSalt.value = pt;
      notifyListeners();
      print(
          'MQTT_LOGS:: New data arrived: topic is <${c[0].topic}>, payload is $pt');
      print('');
    });
    return client;
  }

  void publishTempMessage(String message) {
    const temp = 'topicName/temp';
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);

    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      client.publishMessage(temp, MqttQos.atLeastOnce, builder.payload!);
    }
  }

  void publishSaltMessage(String message) {
    const salt = 'topicName/salt';
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);

    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      client.publishMessage(
        salt,
        MqttQos.atLeastOnce,
        builder.payload!,
      );
    }
  }

  void onConnected() {
    print('Connected');
  }

  void onDisconnected() {
    print('Disconnected');
  }

  void onSubscribed(String? topic) {
    print('Subscribed topic: $topic');
  }

  void onSubscribeFail(String? topic) {
    print('Failed to subscribe topic: $topic');
  }

  void onUnSubscribed(String? topic) {
    print('Unsubscribed topic: $topic');
  }

  void pong() {
    print('Ping response client callback invoked');
  }

  @override
  void dispose() {
    dataSalt.dispose();
    dataTemp.dispose();
    super.dispose();
  }
}

import 'package:flutter/cupertino.dart';

import '../model/mqtt.dart';

class MqttProvider extends ChangeNotifier{
  final MqttService mqttClient;
  MqttProvider({
    required this.mqttClient,
  });
}
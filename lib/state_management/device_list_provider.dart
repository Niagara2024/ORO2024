import 'package:flutter/cupertino.dart';

class DeviceListProvider extends ChangeNotifier{
  String selectedController = '1';
  List<List<String>> myAssets = [
    ['1', 'ORO GEM', '1', '1', '12547896541547896541', 'RF', '10 sec'],
    ['2', 'ORO GEM', '1', '2', '23547985541547896541', 'RF', '5 sec'],
    ['3', 'ORO GEM', '1', '3', '54547985541547896541', 'RF', '5 sec'],
    ['4', 'ORO GEM', '1', '4', '67547985541547896541', 'RF', '5 sec'],
    ['5', 'ORO Smart RTU', '2', '1', '32147896541547896541', 'MQTT', '20 sec'],
    ['6', 'ORO Smart RTU', '2', '2', '78147896541547896541', 'MQTT', '20 sec'],
    ['7', 'ORO Smart RTU', '2', '3', '89147896541547896541', 'MQTT', '20 sec'],
    ['8', 'ORO Smart RTU', '2', '4', '99457896541547896541', 'MQTT', '10 sec'],
    ['9', 'ORO RTU', '3', '1', '21547896541547896541', 'LORA', '5 sec'],
    ['10', 'ORO RTU', '3', '2', '77547896541547896541', 'LORA', '5 sec'],
    ['11', 'ORO RTU', '3', '3', '88547896541547896541', 'LORA', '5 sec'],
    ['12', 'ORO RTU', '3', '4', '99447896541547896541', 'SQTT', '10 sec'],
    ['13', 'ORO RTU', '3', '5', '21034789654154789654', 'SQTT', '10 sec'],
  ];

  void editSelectedController(String value){
    selectedController = value;
    notifyListeners();
  }

  void editInterface(int index, String value){
    myAssets[index][5] = value;
    notifyListeners();
  }

  void editInterval(int index, String value){
    myAssets[index][6] = value;
    notifyListeners();
  }
}
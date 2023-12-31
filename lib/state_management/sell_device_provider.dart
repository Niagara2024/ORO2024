import 'package:flutter/cupertino.dart';

class SellDeviceProvider extends ChangeNotifier{
  String selectedDevice = 'no';
  List<int> selectedList = [];
  String sellTO = '';
  bool longpress = false;

  void editLongPress(bool valve){
    longpress = valve;
    notifyListeners();
  }

  void addFunction(int index){
    selectedList.add(index);
    notifyListeners();
  }

  void removeFunction(int index){
    selectedList.remove(index);
    notifyListeners();
  }

  void clearFunction(){
    selectedList = [];
    notifyListeners();
  }

  void editSellTo(String value){
    sellTO = value;
    notifyListeners();
  }

  List<int> get getList => selectedList;

  void editSellDevices(bool value, int index){
    SellDevices[index]['sell'] = value;
    notifyListeners();
  }
  List<Map<String, dynamic>> SellDevices = [
    {
      'name' : 'Pump Controller',
      'buyDate' : '22/06/2021',
      'replace' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
    {
      'name' : 'ORO RTU',
      'buyDate' : '19/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
    {
      'name' : 'ORO Smart RTU',
      'buyDate' : '01/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
    {
      'name' : 'Valve 1',
      'buyDate' : '11/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
    {
      'name' : 'Valve 2',
      'buyDate' : '22/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
    {
      'name' : 'Valve 3',
      'buyDate' : '22/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
    {
      'name' : 'Valve 4',
      'buyDate' : '22/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
    {
      'name' : 'Valve 5',
      'buyDate' : '22/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
    {
      'name' : 'Valve 6',
      'buyDate' : '22/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
    {
      'name' : 'Valve 7',
      'buyDate' : '22/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
    {
      'name' : 'Pump 1',
      'buyDate' : '22/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
    {
      'name' : 'Pump 2',
      'buyDate' : '12/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
    {
      'name' : 'Water meter 1',
      'buyDate' : '22/10/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354',
      'sell' : false,
    },
  ];

  void selectedSellDevice(int index){
    selectedDevice = '${index}';
    notifyListeners();
  }

  void removeSelected(){
    selectedDevice = 'no';
    notifyListeners();
  }
}
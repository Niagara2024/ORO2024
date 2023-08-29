import 'package:flutter/cupertino.dart';

class MyDeviceProvider extends ChangeNotifier{
  String selectedDevice = 'no';

  List<Map<String, String>> Mydevices = [
    {
      'name' : 'Pump Controller',
      'buyDate' : '22/06/2021',
      'replace' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'ORO RTU',
      'buyDate' : '19/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'ORO Smart RTU',
      'buyDate' : '01/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'Valve 1',
      'buyDate' : '11/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'Valve 1',
      'buyDate' : '22/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'Pump 1',
      'buyDate' : '22/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'Pump 2',
      'buyDate' : '12/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'Water meter 1',
      'buyDate' : '22/10/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
  ];

  void selectedMyDevice(int index){
    selectedDevice = '${index}';
    notifyListeners();
  }

  void removeSelected(){
    selectedDevice = 'no';
    notifyListeners();
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigMakerProvider extends ChangeNotifier{

  List<List<dynamic>> tabs = [
    ['Start','',Icons.play_circle_filled],
    ['Source','Pump',Icons.water],
    ['Irrigation','Pump',Icons.waterfall_chart],
    ['Central','Dosing',Icons.local_drink],
    ['Central','Filtration',Icons.filter_alt],
    ['Irrigation','Lines',Icons.timeline],
    ['Local','Dosing',Icons.local_hospital],
    ['Local','Filtration',Icons.filter_vintage],
    ['Weather','Station',Icons.track_changes],
    ['Mapping','of Output',Icons.compare_arrows],
    ['Mapping','of Input',Icons.compare_arrows],
    ['Finish','',Icons.check_circle],
  ];
//   source pump
//   source pump
//   source pump
  List<String> waterSource = ['A', 'B', 'C', 'D', 'E', 'F'];
  int totalSourcePump = 10;
  List<List<dynamic>> sourcePump = [];
  void editWaterMeter(bool value, int index){
    sourcePump[index][1] = value;
    notifyListeners();
  }
  void addSourcePump(){
    if(totalSourcePump > 0){
      sourcePump.add(['A', false, 'unselect']);
      totalSourcePump = totalSourcePump - 1;
    }
    print(sourcePump);
    notifyListeners();
  }
  void editWaterSource_sp(String value,int index){
    print(value);
    sourcePump[index][0] = value;
    notifyListeners();
  }
  void selectSourcePump(int index){
    if(sourcePump[index][2] == 'select'){
      sourcePump[index][2] = 'unselect';
    }else{
      sourcePump[index][2] = 'select';
    }
    print(sourcePump);
    notifyListeners();
  }
  void deleteSourcePump(){
    for(var i = sourcePump.length - 1; i >= 0; i--){
      print(i);
      if(sourcePump[i][2] == 'select'){
        sourcePump.removeAt(i);
        print(sourcePump[i]);
        totalSourcePump = totalSourcePump + 1;
      }
    }
    print(sourcePump);
    notifyListeners();
  }
//
//
//
  int totalIrrigationPump = 10;
  List<List<dynamic>> irrigationPump = [];

  void irrigationPumpFunctionality(List<dynamic> list){
    switch (list[0]){
      case 'addIrrigationPump': {
        if(totalIrrigationPump > 0){
          irrigationPump.add([false, 'unselect']);
          totalIrrigationPump = totalIrrigationPump - 1;
        }
        break;
      }
      case 'editWaterMeter' : {
        irrigationPump[list[1]][0] = list[2];
        break;
      }
      case 'selectIrrigationPump' : {
        if(irrigationPump[list[1]][1] == 'select'){
          irrigationPump[list[1]][1] = 'unselect';
        }else{
          irrigationPump[list[1]][1] = 'select';
        }
        break;
      }
      case 'deleteIrrigationPump' : {
        for(var i = irrigationPump.length - 1; i >= 0; i--){
          print(i);
          if(irrigationPump[i][1] == 'select'){
            irrigationPump.removeAt(i);
            totalIrrigationPump = totalIrrigationPump + 1;
          }
        }
        break;
      }
      default : {
        break;
      }
    }
    notifyListeners();
  }
//
//
//
  int totalCentralDosing = 10;
  List<List<List<dynamic>>> centralDosing = [
    // [[1,false,false],[2,false,false],['select']],
    // [[1,false,false],[2,false,false],['select']],
    // [[1,false,false],[2,false,false],['select']],
    // [[1,false,false],[2,false,false],['select']],
  ];

  void centralDosingFunctionality(List<dynamic> list){
    switch (list[0]){
      case ('addCentralDosing') : {
        if(totalCentralDosing > 0){
          centralDosing.add([[1,false,false],['select']]);
          totalCentralDosing = totalCentralDosing - 1;
        }
        break;
      }
      case ('editDosingMeter') : {
        centralDosing[list[1]][list[2]][1] = list[3];
        break;
      }
      case ('editBooster') : {
        centralDosing[list[1]][list[2]][2] = list[3];
        break;
      }
      case ('selectCentralDosing') : {
        if(centralDosing[list[1]][centralDosing[list[1]].length - 1][0] == 'unselect'){
          centralDosing[list[1]][centralDosing[list[1]].length - 1][0] = 'select';
        }else{
          centralDosing[list[1]][centralDosing[list[1]].length - 1][0] = 'unselect';
        }
        break;
      }
      case ('deleteCentralDosing') : {
        for(var i = centralDosing.length - 1; i >= 0; i--){
          if(centralDosing[i][centralDosing[i].length - 1][0] == 'select'){
            centralDosing.removeAt(i);
            totalCentralDosing = totalCentralDosing + 1;
          }
        }
        break;
      }
    }
    notifyListeners();
  }
//
//
//
  int totalCentralFiltration = 10;
  List<List<dynamic>> centralFiltration = [
    ['1',false,false,'select']
  ];

}
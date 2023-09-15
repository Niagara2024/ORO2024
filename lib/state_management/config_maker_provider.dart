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
  int totalWaterSource = 6;
  int totalWaterMeter = 15;

  void refreshWaterSourceList(){
    water_source_list = ['-'];
    for(var i = 0;i < sourcePump.length; i++){
      if(!water_source_list.contains(sourcePump[i][0])){
        print('${sourcePump[i][0]}');
        water_source_list.add('${sourcePump[i][0]}');
      }
    }
    for(var i = 0;i < irrigationLines.length;i++){
      if(!water_source_list.contains(irrigationLines[i]['water_source'])){
        irrigationLines[i]['water_source'] = '-';
      }
    }
    print(water_source_list);
    notifyListeners();
  }
//   source pump
//   source pump
//   source pump
  bool sourcePumpSelection = false;
  bool sourcePumpSelectAll = false;
  List<String> waterSource = ['-','A', 'B', 'C', 'D', 'E', 'F'];
  int totalSourcePump = 20;
  List<List<dynamic>> sourcePump = [];
  void sourcePumpFunctionality(List<dynamic> list){
    switch (list[0]){
      case ('editsourcePumpSelection') : {
        sourcePumpSelection = list[1];
        if(list[1] == true){
          for(var i = 0;i < sourcePump.length;i ++){
            sourcePump[i][2] = 'unselect';
          }
        }
        break;
      }
      case ('editsourcePumpSelectAll') : {
        sourcePumpSelectAll = list[1];
        if(list[1] == true){
          for(var i = 0;i < sourcePump.length;i ++){
            sourcePump[i][2] = 'select';
          }
        }
        break;
      }
      case ('editWaterMeter') : {
        if(totalWaterMeter > 0){
          sourcePump[list[1]][1] = list[2];
          if(list[2] == true){
            totalWaterMeter = totalWaterMeter - 1;
          }else{
            totalWaterMeter = totalWaterMeter + 1;
          }

        }
        if(totalWaterMeter == 0){
          if(list[2] == false){
            sourcePump[list[1]][1] = list[2];
            totalWaterMeter = totalWaterMeter + 1;
          }
        }
        break;
      }
      case ('addSourcePump') : {
        if(totalSourcePump > 0){
          sourcePump.add(['-', false, 'unselect']);
          totalSourcePump = totalSourcePump - 1;
          refreshWaterSourceList();
        }
        break;
      }
      case ('editWaterSource_sp') : {
        sourcePump[list[1]][0] = list[2];
        refreshWaterSourceList();
        break;
      }
      case ('selectSourcePump') : {
        if(list[2] == true){
          sourcePump[list[1]][2] = 'select';
        }else{
          sourcePump[list[1]][2] = 'unselect';
        }
        break;
      }
      case ('deleteSourcePump') : {
        for(var i = sourcePump.length -1 ; i >= 0; i--){
          if(sourcePump[i][2] == 'select'){
            if(sourcePump[i][1] == true){
              totalWaterMeter = totalWaterMeter + 1;
            }
            sourcePump.removeAt(i);
            totalSourcePump = totalSourcePump + 1;
            refreshWaterSourceList();
          }
        }
        sourcePumpSelectAll = false;
        sourcePumpSelection = false;
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
  bool irrigationPumpSelection = false;
  bool irrigationPumpSelectAll = false;
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
      case 'editIrrigationPumpSelection' : {
        irrigationPumpSelection = list[1];
        if(list[1] == true){
          for(var i = 0;i < irrigationPump.length;i ++){
            irrigationPump[i][1] = 'unselect';
          }
        }
        break;
      }
      case 'editIrrigationPumpSelectAll' : {
        irrigationPumpSelectAll = list[1];
        if(list[1] == true){
          for(var i = 0;i < irrigationPump.length;i ++){
            irrigationPump[i][1] = 'select';
          }
        }
        break;
      }
      case 'editWaterMeter' : {
        if(totalWaterMeter > 0){
          irrigationPump[list[1]][0] = list[2];
          if(list[2] == true){
            totalWaterMeter = totalWaterMeter - 1;
          }else{
            totalWaterMeter = totalWaterMeter + 1;
          }

        }
        if(totalWaterMeter == 0){
          if(list[2] == false){
            irrigationPump[list[1]][0] = list[2];
            totalWaterMeter = totalWaterMeter + 1;
          }
        }
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
        for(var i = irrigationPump.length -1 ; i >= 0; i--){
          if(irrigationPump[i][1] == 'select'){
            if(irrigationPump[i][0] == true){
              totalWaterMeter = totalWaterMeter + 1;
            }
            irrigationPump.removeAt(i);
            totalIrrigationPump = totalIrrigationPump + 1;
          }
        }
        irrigationPumpSelection = false;
        irrigationPumpSelectAll = false;
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

  void refreshCentralDosingList(){
    central_dosing_site_list = ['-'];
    for(var i = 0;i < centralDosing.length; i++){
      central_dosing_site_list.add('${i + 1}');
    }
    for(var i = 0;i < irrigationLines.length;i++){
      if(!central_dosing_site_list.contains(irrigationLines[i]['Central_dosing_site'])){
        irrigationLines[i]['Central_dosing_site'] = '-';
      }
    }
    notifyListeners();
  }

  void centralDosingFunctionality(List<dynamic> list){
    switch (list[0]){
      case ('addCentralDosing') : {
        if(totalCentralDosing > 0){
          centralDosing.add([[1,false,false],['select']]);
          totalCentralDosing = totalCentralDosing - 1;
          refreshCentralDosingList();
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
            refreshCentralDosingList();
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
  int totalCentralFiltration = 10;
  List<List<dynamic>> centralFiltration = [
    // ['1',false,false,'select'],
    // ['1',false,false,'select'],
  ];

  void refreshCentralFiltrationList(){
    central_filtration_site_list = ['-'];
    for(var i = 0;i < centralFiltration.length; i++){
      central_filtration_site_list.add('${i + 1}');
    }
    for(var i = 0;i < irrigationLines.length;i++){
      if(!central_filtration_site_list.contains(irrigationLines[i]['Central_filtration_site'])){
        irrigationLines[i]['Central_filtration_site'] = '-';
      }
    }
    notifyListeners();
  }

  void centralFiltrationFunctionality(List<dynamic> list){
    switch (list[0]){
      case ('addCentralFiltration') : {
        if(totalCentralFiltration > 0){
          centralFiltration.add(['1',false,false,'unselect']);
          totalCentralFiltration = totalCentralFiltration - 1;
          refreshCentralFiltrationList();
        }
        break;
      }
      case ('editFilters') : {
        centralFiltration[list[1]][0] = list[2];
        break;
      }
      case ('editDownStreamValve') : {
        centralFiltration[list[1]][1] = list[2];
        break;
      }
      case ('editPressureSensor') : {
        centralFiltration[list[1]][2] = list[2];
        break;
      }
      case ('selectCentralFiltration') : {
        if(centralFiltration[list[1]][3] == 'select'){
          centralFiltration[list[1]][3] = 'unselect';
        }else{
          centralFiltration[list[1]][3] = 'select';
        }
        break;
      }
      case ('deleteCentralFiltration') : {
        for(var i = centralFiltration.length - 1; i >= 0; i--){
          if(centralFiltration[i][3] == 'select'){
            centralFiltration.removeAt(i);
            totalCentralFiltration = totalCentralFiltration - 1;
            refreshCentralFiltrationList();
          }
        }
        break;
      }
      default :{
        break;
      }
    }
    notifyListeners();
  }

//
//
//
  int totalIrrigationLine = 100;
  List<String> central_dosing_site_list = ['-',];
  List<String> central_filtration_site_list = ['-',];
  List<String> water_source_list = ['-',];
  List<Map<String,dynamic>> irrigationLines = [
    // {
    //   'valve' : 5,
    //   'main_valve' : 5,
    //   'Central_dosing_site' : '-',
    //   'Central_filtration_site' : '-',
    //   'Local_dosing_site' : false,
    //   'local_filtration_site' : false,
    //   'pressure_sensor' : false,
    //   'water_source' : '-',
    //   'water_meter' : false,
    //   'RTU' : 1,
    //   'ORO_switch' : 1,
    //   'ORO_sense' : 1
    // },
    // {
    //   'valve' : 5,
    //   'main_valve' : 5,
    //   'Central_dosing_site' : '-',
    //   'Central_filtration_site' : '-',
    //   'Local_dosing_site' : false,
    //   'local_filtration_site' : false,
    //   'pressure_sensor' : false,
    //   'water_source' : '-',
    //   'water_meter' : false,
    //   'RTU' : 1,
    //   'ORO_switch' : 1,
    //   'ORO_sense' : 1
    // },
  ];

  void irrigationLinesFunctionality(List<dynamic> list){
    switch (list[0]){
      case ('addIrrigationLine'): {
        if(totalIrrigationLine > 0){
          irrigationLines.add({
            'valve' : 5,
            'main_valve' : 5,
            'Central_dosing_site' : '-',
            'Central_filtration_site' : '-',
            'Local_dosing_site' : false,
            'local_filtration_site' : false,
            'pressure_sensor' : false,
            'water_source' : '-',
            'water_meter' : false,
            'RTU' : 1,
            'ORO_switch' : 1,
            'ORO_sense' : 1,
            'isSelected' : 'unselect'
          },);
          totalIrrigationLine = totalIrrigationLine - 1;
        }
        break;
      }
      case ('selectIrrigationLine'): {
        print('yes');
        if(list[2] == true){
          irrigationLines[list[1]]['isSelected'] = 'select';
        }else{
          irrigationLines[list[1]]['isSelected'] = 'unselect';
        }
        print(irrigationLines[list[1]]['isSelected']);

        break;
      }
      case ('deleteIrrigationLine'): {
        for(var i = irrigationLines.length - 1; i >= 0; i--){
          if(irrigationLines[i]['isSelected'] == 'select'){
            irrigationLines.removeAt(i);
            totalIrrigationLine = totalIrrigationLine + 1;
          }
        }
        break;
      }
      case ('editValve'): {
        irrigationLines[list[1]]['valve'] = list[2];
        break;
      }
      case ('editMainValve'): {
        irrigationLines[list[1]]['main_valve'] = list[2];
        break;
      }
      case ('editCentralDosing'): {
        print('yes');
        print(irrigationLines[list[1]]['Central_dosing_site']);
        print(list[2]);
        irrigationLines[list[1]]['Central_dosing_site'] = list[2];
        break;
      }
      case ('editCentralFiltration'): {
        irrigationLines[list[1]]['Central_filtration_site'] = list[2];
        break;
      }
      case ('editLocalDosing'): {
        irrigationLines[list[1]]['Local_dosing_site'] = list[2];
        if(list[2] == true){
          localDosingFunctionality(['addLocalDosing',list[1]]);
        }else{
          localDosingFunctionality(['deleteLocalDosing',list[1]]);
        }
        break;
      }
      case ('editLocalFiltration'): {
        irrigationLines[list[1]]['local_filtration_site'] = list[2];
        if(list[2] == true){
          localFiltrationFunctionality(['addFiltrationDosing',list[1]]);
        }else{
          localFiltrationFunctionality(['deleteLocalFiltration',list[1]]);
        }
        break;
      }
      case ('editPressureSensor'): {
        irrigationLines[list[1]]['pressure_sensor'] = list[2];
        break;
      }
      case ('editWaterSource'): {
        irrigationLines[list[1]]['water_source'] = list[2];
        break;
      }
      case ('editWaterMeter'): {
        irrigationLines[list[1]]['water_meter'] = list[2];
        break;
      }
      case ('editRTU'): {
        irrigationLines[list[1]]['RTU'] = list[2];
        break;
      }
      case ('editOroSwitch'): {
        irrigationLines[list[1]]['ORO_switch'] = list[2];
        break;
      }
      case ('editOroSense'): {
        irrigationLines[list[1]]['ORO_sense'] = list[2];
        break;
      }
    }
    notifyListeners();
  }
  //
  //
  //
  int totalLocalDosing = 10;
  List<List<dynamic>> localDosing = [
    // [1,false,false],
    // [1,false,false],
  ];
  void localDosingFunctionality(List<dynamic> list){
    switch (list[0]){
      case ('addLocalDosing'):{
        if(totalLocalDosing > 0){
          localDosing.add([list[1] + 1,1,false,false,'unselect']);
          totalLocalDosing = totalLocalDosing - 1;
        }
        localDosing.sort((a, b) => a[0].compareTo(b[0]));
        break;
      }
      case ('editDosingMeter') :{
        localDosing[list[1]][2] = list[2];
        break;
      }
      case ('editBoosterPump') :{
        localDosing[list[1]][3] = list[2];
        break;
      }
      case ('selectLocalDosing') :{
        if(localDosing[list[1]][4] == 'select'){
          localDosing[list[1]][4] = 'unselect';
        }else{
          localDosing[list[1]][4] = 'select';
        }
        break;
      }
      case ('deleteLocalDosing') : {
        for(var i = localDosing.length - 1; i >= 0; i--){
          if(localDosing[i][4] == 'select'){
            irrigationLines[localDosing[i][0] - 1]['Local_dosing_site'] = false;
            localDosing.removeAt(i);
            totalLocalDosing = totalLocalDosing + 1;
          }
        }
        for(var i = 0;i < localDosing.length;i++){
          if(localDosing[i][0] == list[1] + 1){
            irrigationLines[localDosing[i][0] - 1]['Local_dosing_site'] = false;
            localDosing.removeAt(i);
            totalLocalDosing = totalLocalDosing + 1;
          }
        }
        break;
      }
      default :{
        break;
      }
    }
    notifyListeners();
  }

  int totalLocalFiltration = 10;
  List<List<dynamic>> localFiltration = [
    // [1,false,false],
    // [1,false,false],
  ];
  void localFiltrationFunctionality(List<dynamic> list){
    switch (list[0]){
      case ('addFiltrationDosing'):{
        if(totalLocalFiltration > 0){
          localFiltration.add([list[1] + 1,'0',false,false,'unselect']);
          totalLocalFiltration = totalLocalFiltration - 1;
        }
        localFiltration.sort((a, b) => a[0].compareTo(b[0]));
        print(localFiltration);
        break;
      }
      case ('editFilter') :{
        localFiltration[list[1]][1] = list[2];
        break;
      }
      case ('editDownStreamValve') :{
        localFiltration[list[1]][2] = list[2];
        break;
      }
      case ('editDiffPressureSensor') :{
        localFiltration[list[1]][3] = list[2];
        break;
      }
      case ('selectLocalFiltration') :{
        if(localFiltration[list[1]][4] == 'select'){
          localFiltration[list[1]][4] = 'unselect';
        }else{
          localFiltration[list[1]][4] = 'select';
        }
        print(localFiltration);
        break;
      }
      case ('deleteLocalFiltration') : {
        for(var i = localFiltration.length - 1; i >= 0; i--){
          if(localFiltration[i][4] == 'select'){
            irrigationLines[localFiltration[i][0] - 1]['local_filtration_site'] = false;
            localFiltration.removeAt(i);
            totalLocalFiltration = totalLocalFiltration + 1;
          }
        }
        for(var i = 0;i < localFiltration.length;i++){
          if(localFiltration[i][0] == list[1] + 1){
            irrigationLines[localFiltration[i][0] - 1]['local_filtration_site'] = false;
            localFiltration.removeAt(i);
            totalLocalFiltration = totalLocalFiltration + 1;
          }
        }
        break;
      }
      default :{
        break;
      }
    }
    notifyListeners();
  }

}
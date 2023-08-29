import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CustomerDevicePvd extends ChangeNotifier{
  String filterRating = 'no';
  String selected = 'no';
  List<Map<String, String>> listOfCustomer = [
    {
      'name' : 'Suresh',
      'number' : '9947815632',
      'city' : 'Chennai',
      'device' : 'Pump Controller',
      'rating' : 'yes',
      'profile' : ''
    },
    {
      'name' : 'GopalaKrishnan',
      'number' : '9856745568',
      'city' : 'Coimbatore',
      'device' : 'ORO Gem',
      'rating' : 'no',
      'profile' : ''
    },
    {
      'name' : 'Venkatesh',
      'number' : '9145368745',
      'city' : 'Selam',
      'device' : 'Pump Controller',
      'rating' : 'yes',
      'profile' : ''
    },
    {
      'name' : 'Saravanan',
      'number' : '9758975841',
      'city' : 'Thiruvarur',
      'device' : 'ORO SMART',
      'rating' : 'no',
      'profile' : ''
    },
    {
      'name' : 'Kandiraj',
      'number' : '8794562458',
      'city' : 'Palani',
      'device' : 'ORO Gem',
      'rating' : 'yes',
      'profile' : ''
    },
    {
      'name' : 'Kamaraj',
      'number' : '8487968715',
      'city' : 'Thirupur',
      'device' : 'Pump Controller',
      'rating' : 'no',
      'profile' : ''
    },
    {
      'name' : 'SivaPrakash',
      'number' : '8487968715',
      'city' : 'Coimbatore',
      'device' : 'Pump Controller',
      'rating' : 'yes',
      'profile' : ''
    },
    {
      'name' : 'MohanRaj',
      'number' : '8487968715',
      'city' : 'Thirupur',
      'device' : 'Pump Controller',
      'rating' : 'no',
      'profile' : ''
    },
    {
      'name' : 'Vaishnavi',
      'number' : '8487968715',
      'city' : 'Thirupur',
      'device' : 'Pump Controller',
      'rating' : 'yes',
      'profile' : ''
    },
    {
      'name' : 'SaravanaKumar',
      'number' : '8487968715',
      'city' : 'Thirupur',
      'device' : 'Pump Controller',
      'rating' : 'no',
      'profile' : ''
    }

  ];

  List<Map<String, String>> customerDeviceList = [
    {
      'name' : 'Pump Controller',
      'saledDate' : '22/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'ORO RTU',
      'saledDate' : '19/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'ORO Smart RTU',
      'saledDate' : '01/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'Valve 1',
      'saledDate' : '11/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'Valve 1',
      'saledDate' : '22/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'Pump 1',
      'saledDate' : '22/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'Pump 2',
      'saledDate' : '12/06/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
    {
      'name' : 'Water meter 1',
      'saledDate' : '22/10/2021',
      'selected' : 'no',
      'IMEI' : '845643665656354'
    },
  ];

  void selectedDevice(int index){
    if(selected != 'no'){
      customerDeviceList[int.parse(selected)]['selected'] = 'no';
      notifyListeners();
    }
    customerDeviceList[index]['selected'] = 'yes';
    selected = '${index}';
    notifyListeners();
    print(selected);
  }

  void removeSelected(){
    if(selected != 'no'){
      customerDeviceList[int.parse(selected)]['selected'] = 'no';
      selected = 'no';
      notifyListeners();
    }
  }

  List<Map<String, String>> onlyRated(){
    List<Map<String, String>> myList = [];
    for(var i in listOfCustomer){
      if(i['rating'] == 'yes'){
        myList.add(i);
      }
    }
    return myList;
  }

  void changeRating(int index){
    listOfCustomer[index]['rating'] = listOfCustomer[index]['rating'] == 'yes' ? 'no' : 'yes';
    print(listOfCustomer[index]['rating']);
    notifyListeners();
  }

  void changeFilterRating(){
    filterRating = filterRating == 'yes' ? 'no' : 'yes';
    notifyListeners();
  }


}
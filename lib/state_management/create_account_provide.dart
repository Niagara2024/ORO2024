import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateActProvider extends ChangeNotifier{

  String name = '';
  String mobile_number = '';
  String email_id = '';
  String taluk = '';
  String village = '';
  String pincode = '';
  String add1 = '';
  String add2 = '';

  String getValue(String title){
    switch(title){
      case 'name': {
        return name;
      }
      case 'mobile_number': {
        return mobile_number;
      }
      case 'email_id': {
        return email_id;
      }
      case 'taluk': {
        return taluk;
      }
      case 'village': {
        return village;
      }
      case 'pincode': {
        return pincode;
      }
      case 'add1': {
        return add1;
      }
      case 'add2': {
        return add2;
      }
      default: {
        return 'nothing';
      }

    }
  }

  void listenValueLength(String title, String value){
    switch(title){
      case 'name': {
        name = value;
        notifyListeners();
      }
      break;
      case 'mobile_number': {
        mobile_number = value;
        notifyListeners();
      }
      break;
      case 'email_id': {
        email_id = value;
        notifyListeners();
      }
      break;
      case 'taluk': {
        taluk = value;
        notifyListeners();
      }
      break;
      case 'village': {
        village = value;
        notifyListeners();
      }
      break;
      case 'pincode': {
        pincode = value;
        notifyListeners();
      }
      break;
      case 'add1': {
        add1 = value;
        notifyListeners();
      }
      break;
      case 'add2': {
        add2 = value;
        notifyListeners();
      }
      break;
      default: {
        print("This is default case");
      }
      break;

    }
  }

}
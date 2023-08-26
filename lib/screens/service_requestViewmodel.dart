import 'package:flutter/material.dart';
import 'package:oro_2024/model/service_requestmodel.dart';

class ServiceRequestViewModel extends ChangeNotifier {
  List<ServiceRequest> serviceRequest = [
    ServiceRequest(
        'John Doe', '+1234567890', 'Hello there!', '8976543223456', 2),
    ServiceRequest(
        'Jane roe', '+9876543210', 'Hi! How are you?', '8976543223453', 2),
    ServiceRequest(
        'Jane Smith', '+9876543210', 'Hi! How are you?', '89765432234567', 2),
    ServiceRequest(
        'Jane ', '+9876543210', 'Hi! How are you?', '89765432234531', 2),
    ServiceRequest(
        'Smith', '+9876543210', 'Hi! How are you?', '8976543223459', 2),
  ];

  void refreshContacts() {
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class GreetingHelper {
  static String getGreeting() {
    DateTime now = DateTime.now();
    String greeting = '';
    if (now.hour >= 0 && now.hour < 12) {
      greeting = 'Good Morning';
    } else if (now.hour >= 12 && now.hour < 18) {
      greeting = 'Good Afternoon';
    } else if (now.hour >= 18 && now.hour < 21) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Night';
    }
    return greeting;
  }
}

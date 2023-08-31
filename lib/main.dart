import 'package:flutter/material.dart';
import 'package:oro_2024/screens/create_account.dart';
import 'package:oro_2024/screens/dummy.dart';
import 'package:oro_2024/screens/my_device.dart';
import 'package:oro_2024/screens/splash_screen.dart';
import 'package:oro_2024/state_management/create_account_provide.dart';
import 'package:oro_2024/state_management/customer_device_provider.dart';
import 'package:oro_2024/state_management/my_device_provider.dart';
import 'package:oro_2024/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CreateActProvider()),
      ChangeNotifierProvider(create: (context) => CustomerDevicePvd()),
      ChangeNotifierProvider(create: (context) => MyDeviceProvider()),
    ],
    child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ORO DRIP IRRIGATION',
      theme: myTheme,
      // home: const SplashScreen(),
      // home: HomePage(),
      home: MyDevice(purpose: '', title: '',),
      // home: CreateAccountScreen(),
    );
  }
}

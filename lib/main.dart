import 'package:flutter/material.dart';
import 'package:oro_2024/screens/SharedDevice.dart';
import 'package:oro_2024/screens/splash_screen.dart';
import 'package:oro_2024/state_management/create_account_provide.dart';
import 'package:oro_2024/state_management/customer_device_provider.dart';
import 'package:oro_2024/state_management/sell_device_provider.dart';
import 'package:oro_2024/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CreateActProvider()),
      ChangeNotifierProvider(create: (context) => CustomerDevicePvd()),
      ChangeNotifierProvider(create: (context) => SellDeviceProvider()),
      ChangeNotifierProvider(create: (context) => DeviceListViewModel()),
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
      home: const SplashScreen(),
      // home: HomePage(),
      // home: SellDevice(purpose: '', title: '',),
      // home: CreateAccountScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:oro_2024/screens/SharedDevice.dart';
import 'package:oro_2024/screens/config_maker/config_maker.dart';
import 'package:oro_2024/screens/create_account.dart';
import 'package:oro_2024/screens/device_list_screen.dart';
import 'package:oro_2024/screens/dummy.dart';
import 'package:oro_2024/screens/gauge.dart';
import 'package:oro_2024/screens/home_screen.dart';
import 'package:oro_2024/screens/my_stepper.dart';
import 'package:oro_2024/screens/sell_device.dart';
import 'package:oro_2024/screens/splash_screen.dart';
import 'package:oro_2024/state_management/config_maker_provider.dart';
import 'package:oro_2024/state_management/create_account_provide.dart';
import 'package:oro_2024/state_management/customer_device_provider.dart';
import 'package:oro_2024/state_management/device_list_provider.dart';
import 'package:oro_2024/state_management/sell_device_provider.dart';
import 'package:oro_2024/state_management/single_instance_of_mqtt_provider.dart';
import 'package:oro_2024/utils/theme.dart';
import 'package:provider/provider.dart';

import 'model/mqtt.dart';

void main() {
  print('get started');
  // MqttService mqtt = MqttService();
  // mqtt.onPRessMQTTTest();
  // mqtt.initializeMqttClient();
    runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CreateActProvider()),
      ChangeNotifierProvider(create: (context) => CustomerDevicePvd()),
      ChangeNotifierProvider(create: (context) => SellDeviceProvider()),
      ChangeNotifierProvider(create: (context) => DeviceListViewModel()),
      ChangeNotifierProvider(create: (context) => DeviceListProvider()),
      ChangeNotifierProvider(create: (context) => ConfigMakerProvider()),
      // ChangeNotifierProvider(create: (context) => MqttProvider(mqttClient: mqtt)),
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
      // home: DeviceListScreen(),
      home: ConfigMakerScreen(),
      // home: HomeScreen(),
      // home: SellDevice(purpose: '', title: '',),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:oro_2024/StateManagement_provider/MyDevice_Provider.dart';
import 'package:oro_2024/StateManagement_provider/Service_Request_Provider.dart';
import 'package:oro_2024/screens/SharedDevice.dart';
import 'package:oro_2024/screens/servicerequstlist_view.dart';
import 'package:oro_2024/screens/splash_screen.dart';
import 'package:oro_2024/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ///provider class in MultiProvider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => DeviceListViewModel())),
        ChangeNotifierProvider(
          create: (context) => ServiceRequestViewModel(),
        ),
        ChangeNotifierProvider(create: (context) => CustomerDevicePvd()),
        ChangeNotifierProvider(create: (context) => MyDeviceProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ServiceRequestViewModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ORO DRIP IRRIGATION',
          theme: myTheme,
          home: SplashScreen(),
        ));
  }
}

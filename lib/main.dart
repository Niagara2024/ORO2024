import 'package:flutter/material.dart';
import 'package:oro_2024/screens/Service_request.dart';
import 'package:oro_2024/screens/splash_screen.dart';
import 'package:oro_2024/utils/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
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
          home: const SplashScreen(),
        ));
  }
}
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//this is state widget
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ORO',),
        centerTitle: true,
      ),
      drawer: Drawer(

      ),
      body: const Center(
        child: Text('ORO DRIP IRRIGATION'),
      ),
    );
  }
}

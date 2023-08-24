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
        title: const Text(
          'ORO',
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        elevation: 2.0,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              accountName: Text(
                'Venkatesan',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
              accountEmail: Text(
                '9123590805\nvenkatesan.niagara@gmail.com',
                style: TextStyle(fontSize: 14.0, color: Colors.black87),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'NSV', // Extract the first letter
                  style: TextStyle(fontSize: 30, color: Colors.amber),
                ),
                // radius: 20,
              ),
            ),
            ListTile(
              selectedColor: Colors.amber,
              title: const Text('Service Request'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Sell To Controller'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Customer Device'),
              onTap: () {
                //
              },
            ),
            ListTile(
              title: const Text('My Device'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Shared Device'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Replace'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('ORO DRIP IRRIGATION'),
      ),
    );
  }
}

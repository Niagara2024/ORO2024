import 'package:flutter/material.dart';
import 'package:oro_2024/screens/servicerequstlist_view.dart';
import 'package:oro_2024/utils/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//this is state widget
class _HomeScreenState extends State<HomeScreen> {
  List drawerItems = [
    'Service Request',
    'Sell To Controller',
    'Customer Device',
    'My Device',
    'Shared Device',
    'Replace',
    'Logout'
  ];
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
        elevation: 10.0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(),
              accountName: Text(
                'Venkatesan',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              accountEmail: Text(
                '9123590805\nvenkatesan.niagara@gmail.com',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  'NSV', // Extract the first letter
                ),
                // radius: 20,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: drawerItems
                  .length, // Replace with the number of items you have
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: ListTile(
                    title: Text(
                      drawerItems[index],
                    ), // Replace with your item text
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ServiceRequestlistView(),
                        ),
                      );
                    },
                  ),
                );
              },
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

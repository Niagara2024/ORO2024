import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Menu',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: ResponsiveMenu(),
    );
  }
}

class ResponsiveMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive Menu')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 800) {
            // Mobile layout with GridView
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Handle item tap
                  },
                  child: GridTile(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            // Desktop layout with Side Drawer
            return Scaffold(
              body: Center(
                child: Text('Main content'),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    ListTile(
                      title: Text('Item 1'),
                      onTap: () {
                        // Handle item tap
                      },
                    ),
                    ListTile(
                      title: Text('Item 2'),
                      onTap: () {
                        // Handle item tap
                      },
                    ),
                    // Add more menu items here
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:oro_2024/screens/dealerdashboard/dealerdashboardmodel.dart';
import 'package:oro_2024/screens/dealerdashboard/dealerdashboardview.dart';

class Dashbard extends StatelessWidget {
  final CardController controller = CardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 24,
          color: Colors.white,
        ),
        backgroundColor: Colors.amber,
        title: const Text(
          'Dealer DashBoard',
          textAlign: TextAlign.center,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0, // Vertical spacing
          crossAxisSpacing: 16.0, // Number of columns in the grid
        ),
        itemCount: controller.cardsadmin.length,
        itemBuilder: (context, index) {
          final item = controller.cardsadmin[index];
          return DashboardCardView(title: item.title);
        },
      ),
    );
  }
}

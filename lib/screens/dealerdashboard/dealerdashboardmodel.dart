import 'package:flutter/material.dart';
import 'package:oro_2024/screens/dealerdashboard/dealerdashboardview.dart';

class DashboardModel {
  final String title;
  final String content;

  DashboardModel(this.title, this.content);
}

class CardController {
  final List<DashboardModel> cards = [
    DashboardModel('Service Request', 'Content for Card 1'),
    DashboardModel('Sell To Controller', 'Content for Card 2'),
    DashboardModel('Customer Device', 'Content for Card 3'),
    DashboardModel('My Device', 'Content for Card 4'),
    DashboardModel('Shared Device', 'Content for Card 5'),
    DashboardModel('Replace', 'Content for Card 6'),
  ];
  final List<DashboardModel> cardsadmin = [
    DashboardModel('Service Request', 'Content for Card 1'),
    DashboardModel('Inventory', 'Content for Card 2'),
    DashboardModel('Customer Device', 'Content for Card 3'),
    DashboardModel('My Device', 'Content for Card 4'),
    DashboardModel('Service Request Transfer', 'Content for Card 5'),
    DashboardModel('Replace', 'Content for Card 6'),
    DashboardModel('Transfer Customer', 'Content for Card 7'),
    DashboardModel('Sell To Controller', 'Content for Card 8'),
  ];

  List<Widget> getCardViews() {
    return cards
        .map((card) => DashboardCardView(
              title: card.title,
            ))
        .toList();
  }
}

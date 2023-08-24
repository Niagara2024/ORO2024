import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardCardView extends StatelessWidget {
  final String title;

  DashboardCardView({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Apply border radius here
      ),
      child: Container(
        // height: 150.dg,
        // width: 150.dg,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(20)), // Apply border radius here as well
          gradient: LinearGradient(
            colors: [
              Colors.yellow,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

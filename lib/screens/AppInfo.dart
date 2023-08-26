import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  State<AppInfo> createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Info"),
      ),
      body: ListView(
        children: const [
          SizedBox(height: 20),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'Version : ',
                style: TextStyle(fontSize: 18),
                children: [
                  TextSpan(
                    text: '1.0.1',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'Last Update : ',
                style: TextStyle(fontSize: 18),
                children: [
                  TextSpan(
                    text: 'Jan 1  2024',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'App Name : ',
                style: TextStyle(fontSize: 18),
                children: [
                  TextSpan(
                    text: 'ORO Irrigation controller',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome to ORO smart Drip irrigation, The smart solution for controlling and monitoring your irrigation system. Whether you are managing a small garden or a large agricultural field, our app empowers you to optimize water usage and keep your plants thriving.',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Features :'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '1. Remote Control: Easily manage your irrigation system from anywhere using your smartphone or table',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '2. Smart Scheduling: Set up customized watering schedules based on your plants needs, weather conditions, and local regulations.',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '3. Weather Integration: Our app syncs with real-time weather data to adjust irrigation schedules and conserve water during rainy periods.',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '4. Usage Analytics: Track your water consumption and receive insights to make informed decisions about your irrigation strategy.',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '5. Notifications: Receive alerts and notifications about system status, maintenance reminders, and more.',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Center(
            child: Text(
              'Privacy Policy',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 20,
                color: Colors.blueAccent
              ),
            ),
          ),
          SizedBox(height: 25),
          Center(
            child: Text(
              'Terms and conditions',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                  color: Colors.blueAccent
              ),
            ),
          ),
          SizedBox(height: 20),

        ],
      ),
    );
  }
}

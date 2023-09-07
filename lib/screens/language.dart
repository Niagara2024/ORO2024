import 'package:oro_2024/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LanguageSelectionScreen(),
    );
  }
}

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'English';

  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'தமிழ்', 'locale': Locale('ta', 'IN')},
    {'name': 'ಕನ್ನಡ', 'locale': Locale('kn', 'IN')},
    {'name': 'हिंदी', 'locale': Locale('hi', 'IN')},
    {'name': 'മലയാളം', 'locale': Locale('ml', 'IN')},
    {'name': 'తెలుగు', 'locale': Locale('te', 'IN')},
  ];

  updateLanguage(Locale locale) {
    print(locale);
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Select language',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: locale.map((language) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(language['name']),
                    leading: Radio<String>(
                      value: language['name'],
                      groupValue: selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value.toString();
                          updateLanguage(language['locale']);
                          print('hello'.tr);
                        });
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Selected Language: ${selectedLanguage.tr}'),
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const HomeScreen()));
                    },
                    child: Text('Next'.tr)))
          ],
        ),
      ),
    );
  }
}

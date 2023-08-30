import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPermission extends StatefulWidget {
  const UserPermission({Key? key}) : super(key: key);

  @override
  State<UserPermission> createState() => _UserPermissionState();
}

class _UserPermissionState extends State<UserPermission> {

  List<String> _texts = [
    "Motor on/off",
    "Settings access",
    "Program creation",
    "Program updation",
    "Program delete access",
    "RTC Settings",
    "View reports"
  ];

  late List<bool> _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(_texts.length, false);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Permission'),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: _texts.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            secondary: CircleAvatar(child: Icon(Icons.settings_outlined, color: Colors.white,),),
            title: Text(_texts[index]),
            subtitle: Text("Sub title"),
            value: _isChecked[index],
            onChanged: (val) {
              setState(() {
                _isChecked[index] = val!;
              },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
          });
        },
        child: const Icon(Icons.send),
      ),
    );

  }

}

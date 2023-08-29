import 'package:flutter/material.dart';

class ReplaceDevice extends StatefulWidget {
  const ReplaceDevice({super.key});

  @override
  State<ReplaceDevice> createState() => _ReplaceDeviceState();
}

class _ReplaceDeviceState extends State<ReplaceDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Replace'),
      ),
    );
  }
}

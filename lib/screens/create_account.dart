import 'package:flutter/material.dart';
import 'package:siva_oro_2024/custom_widgets/AppBarNeeds.dart';
import 'package:siva_oro_2024/theme/Theme.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        leading: AppBarArrow(),
        title: AppBarText(title: 'Create Account',),
      ),
    );
  }
}

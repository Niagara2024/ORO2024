import 'package:flutter/material.dart';

import '../theme/Theme.dart';

class AppBarText extends StatefulWidget {
  final String title;
  const AppBarText({super.key,
    required this.title});

  @override
  State<AppBarText> createState() => _AppBarTextState();
}

class _AppBarTextState extends State<AppBarText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.title}', style: appBarText,
    );
  }
}

class AppBarArrow extends StatefulWidget {
  const AppBarArrow({super.key});

  @override
  State<AppBarArrow> createState() => _AppBarArrowState();
}

class _AppBarArrowState extends State<AppBarArrow> {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.arrow_back, size: 24, color: Colors.white,);
  }
}


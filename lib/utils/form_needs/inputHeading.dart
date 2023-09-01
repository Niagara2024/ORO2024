import 'package:flutter/material.dart';

import '../theme.dart';

class InputHeading extends StatelessWidget {
  final String heading;
  const InputHeading({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 10.0),
      child: Text('${heading}', style: inputsHeading,),
    );
  }
}
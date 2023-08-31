import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final PrimaryColor = const Color(0xFF0D5D9A);
final liteBlue = const Color(0xFFEEF3F7);
final grey = const Color(0xFF9EBED7);
final liteYellow = const Color(0xFFFFD44C);
final thickYellow = const Color(0xFFFFB402);


final appBarText = GoogleFonts.poppins(
  fontSize: 24,
  color: Colors.white,
);

final inputsHeading = GoogleFonts.poppins(
  fontSize: 14,
  color: Colors.black87,
  fontWeight: FontWeight.w400
);

final Text14 = GoogleFonts.poppins(
    fontSize: 14,
    color: PrimaryColor,
);

final Text20 = GoogleFonts.poppins(
  fontSize: 20,
  color: PrimaryColor,
);

InputDecoration inputDecoration(Icon icon){
  return InputDecoration(
    border: InputBorder.none,
    prefixIcon: icon,
    counterText: '',
    contentPadding: EdgeInsets.all(10),
  );
}
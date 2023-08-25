import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: const Color(0xFF0D5D9A),
  primaryColorLight: Colors.white,
  primaryColorDark: Colors.black,
  canvasColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  // cardColor: Colors.purple[100],
  dividerColor: Colors.grey,
  focusColor: Colors.blue,
  hoverColor: Colors.grey[300],
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  splashFactory: InkSplash.splashFactory,
  // unselectedWidgetColor: Colors.grey,
  disabledColor: Colors.grey[400],
  fontFamily: GoogleFonts.poppins().fontFamily,

  //App bar theme
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 23
    ),
    elevation: 3,
    shadowColor: Colors.white,
    color: Color(0xFF0D5D9A),
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),

  //button theme
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    buttonColor: Colors.white
  ),

  // Elevated button theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // backgroundColor: const Color(0xFF0D5D9A),
      textStyle: const TextStyle(color: Colors.white),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      animationDuration: Duration(seconds: 2)
    ),
  ),

  secondaryHeaderColor: Colors.white,
  dialogBackgroundColor: Colors.white,
  indicatorColor: Colors.blue,
  hintColor: Colors.grey,

  //Text theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black
    ),
    displayMedium: TextStyle(
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      color: Colors.blue,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
    ),

    //for drawer title
    headlineSmall: TextStyle(
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 16
    ),
    bodySmall: TextStyle(
      color: Colors.black,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
    ),
  ),

  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),

  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
     if (states.contains(MaterialState.disabled)) { return null; }
     if (states.contains(MaterialState.selected)) { return const Color(0xFF0D5D9A); }
     return null;
 }),
  ),

  radioTheme: RadioThemeData(
   fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
   if (states.contains(MaterialState.disabled)) { return null; }
   if (states.contains(MaterialState.selected)) { return const Color(0xFF0D5D9A); }
   return null;
 }),
 ),

  switchTheme: SwitchThemeData(
   thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
   if (states.contains(MaterialState.disabled)) { return null; }
   if (states.contains(MaterialState.selected)) { return const Color(0xFF0D5D9A); }
   return null;
 }),

 trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
   if (states.contains(MaterialState.disabled)) { return null; }
   if (states.contains(MaterialState.selected)) { return const Color(0xFF0D5D9A); }
   return null;
 }),
 ),

  iconTheme: const IconThemeData(color: Color(0xFF0D5D9A)),
  primaryIconTheme: const IconThemeData(color: Color(0xFF0D5D9A)),

  sliderTheme: SliderThemeData(
    activeTrackColor: const Color(0xFF0D5D9A),
    inactiveTrackColor: Colors.grey[300],
    thumbColor: const Color(0xFF0D5D9A),
    overlayColor: const Color(0x290D5D9A),
  ),

  //Tab bar theme
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xFF0D5D9A),
    unselectedLabelColor: Colors.grey,
  ),

  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(
      color: Colors.black87,
      borderRadius: BorderRadius.circular(4),
    ),
    textStyle: const TextStyle(color: Colors.white),
  ),

  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),

  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey[300],
    deleteIconColor: Colors.grey,
    selectedColor: const Color(0xFF0D5D9A),
    secondarySelectedColor: Colors.grey,
    labelStyle: const TextStyle(color: Colors.black),
    padding: const EdgeInsets.all(8),
    shape: const StadiumBorder(),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black45),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50))
    ),
    activeIndicatorBorder: BorderSide(
      color: Color(0xFF0D5D9A)
    ),
      contentPadding: EdgeInsets.all(15)
  ),

  platform: TargetPlatform.android,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  applyElevationOverlayColor: true,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: const MaterialColor(0xFF0D5D9A, {
    50: Color(0xFF0D5D9A),
    100: Color(0xFF0D5D9A),
    200: Color(0xFF0D5D9A),
    300: Color(0xFF0D5D9A),
    400: Color(0xFF0D5D9A),
    500: Color(0xFF0D5D9A),
    600: Color(0xFF0D5D9A),
    700: Color(0xFF0D5D9A),
    800: Color(0xFF0D5D9A),
    900: Color(0xFF0D5D9A),
  })).copyWith(
    background: const Color(0xFF0D5D9A),
    secondary: const Color(0xFFFFCB3A),
  ).copyWith(secondary: const Color(0xFFFFCB3A)).copyWith(background: Colors.white).copyWith(error: Colors.red),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.blue,
    selectionColor: Colors.blue,
    selectionHandleColor: Colors.blue,),
);


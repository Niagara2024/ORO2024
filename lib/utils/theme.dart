import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final PrimaryColor = const Color(0xFF0D5D9A);
final liteBlue = const Color(0xFFEEF3F7);
final grey = const Color(0xFF9EBED7);
final liteYellow = const Color(0xFFFFD44C);
final thickYellow = const Color(0xFFFFB402);

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
  focusColor: Colors.amber,
  hoverColor: Colors.grey[300],
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  splashFactory: InkSplash.splashFactory,
  // unselectedWidgetColor: Colors.grey,
  disabledColor: Colors.grey[400],
  fontFamily: GoogleFonts.poppins().fontFamily,

  popupMenuTheme: const PopupMenuThemeData(
    surfaceTintColor: Colors.white

  ),

  //App bar theme
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(
      color: Colors.white
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontFamily:GoogleFonts.poppins().fontFamily
    ),
    elevation: 3,
    shadowColor: Colors.white,
    color: const Color(0xFF0D5D9A),
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
      animationDuration: const Duration(seconds: 2)
    ),
  ),

  secondaryHeaderColor: Colors.white,
  dialogBackgroundColor: Colors.white,
  indicatorColor: Colors.amber,
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
      color: Colors.amber,
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
        if (states.contains(MaterialState.selected)) { return const Color(0xFFFFCB3A); }
        return const Color(0xFF0D5D9A);
      }),
      trackOutlineColor: MaterialStateProperty.all(const Color(0xFF0D5D9A)),

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
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.grey,
    indicatorColor: Colors.amber,
    labelStyle: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 16)
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
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),

  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontFamily: GoogleFonts.poppins().fontFamily
    )
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

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black45),
    filled: true,
    fillColor: const Color(0xFF0D5D9A).withOpacity(0.1),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none
    ),
    activeIndicatorBorder: const BorderSide(
      color: Color(0xFF0D5D9A)
    ),
    contentPadding: const EdgeInsets.all(15)
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
    cursorColor: Colors.amber,
    selectionColor: Colors.amber,
    selectionHandleColor: Colors.amber,),
);

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




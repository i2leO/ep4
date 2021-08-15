import 'package:age_calculator/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant/color.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('th', 'TH'), // Thailand
      ],
      debugShowCheckedModeBanner: false,
      title: 'แอพคำนวณอายุ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.light(
          primary: primaryColor, // header background color
          onPrimary: textColor, // header text color
          onSurface: textColor, // body text color
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: secondaryColor, // button text color
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home.dart';
import 'utilities/appColors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData.light().copyWith(
        backgroundColor: OffWhite,
        textTheme: GoogleFonts.gugiTextTheme(Theme.of(context).textTheme),
      ),
      home: Home(),
    );
  }
}

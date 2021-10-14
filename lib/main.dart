import 'package:flutter/material.dart';
import 'package:flutter_udacity_course/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'categories_screen.dart';

void main() {
  runApp(const UnitConverterApp());
}

const kAppName = 'Unit Converter';

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      home: Scaffold(
        //backgroundColor: Colors.green[100],
        appBar: const AppBarCustom(
          title: kAppName,
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.zero,
            child: CategoriesScreen(),
            // Category(
            //   label: 'Cake',
            //   icon: Icons.cake,
            //   color: Colors.green,
            // ),
          ),
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: kAppDarkColorScheme,
        primaryColor: kDarkBackgroundColor,
        primaryColorDark: kWhiteColor,
        scaffoldBackgroundColor: kDarkBackgroundColor,
        backgroundColor: kDarkBackgroundColor,
        dialogBackgroundColor: kSecondaryColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    );
  }
}

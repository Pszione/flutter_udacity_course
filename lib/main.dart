import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_udacity_course/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'categories_screen.dart';

void main() {
  runApp(const UnitConverterApp());
}

const kAppName = 'Unit Converter';

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({Key? key}) : super(key: key);
  final int currentIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      home: Scaffold(
        //backgroundColor: Colors.green[100],
        appBar: AppBarCustom(
          title: kAppName,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.zero, child: CategoriesScreen(),
            // Category(
            //   label: 'Cake',
            //   icon: Icons.cake,
            //   color: Colors.green,
            // ),
          ),
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              height: AppBar().preferredSize.height * 1.6,
              indicatorColor: kSecondaryColor,
              labelTextStyle: MaterialStateProperty.all(const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                letterSpacing: 2.1,
              )),
              iconTheme: MaterialStateProperty.all(
                const IconThemeData(size: kCategorySmallIconSize),
              )),
          child: NavigationBar(
            selectedIndex: currentIndex,
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  FontAwesomeIcons.ruler,
                ),
                label: 'Conversions',
                tooltip: 'Unit conversions list',
              ),
              NavigationDestination(
                icon: Icon(
                  FontAwesomeIcons.cog,
                  size: kCategorySmallIconSize,
                ),
                label: 'Settings',
                tooltip: 'More settings',
              ),
            ],
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

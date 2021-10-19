import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_udacity_course/constants.dart';
import 'package:flutter_udacity_course/settings_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'categories_screen.dart';

void main() {
  runApp(const UnitConverterApp());
}

const kAppName = 'Unit Converter';

class UnitConverterApp extends StatefulWidget {
  const UnitConverterApp({Key? key}) : super(key: key);

  @override
  State<UnitConverterApp> createState() => _UnitConverterAppState();
}

class _UnitConverterAppState extends State<UnitConverterApp> {
  int currentIndex = 0;

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
        body: currentIndex == 0
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.zero, child: CategoriesScreen(),
                  // Category(
                  //   label: 'Cake',
                  //   icon: Icons.cake,
                  //   color: Colors.green,
                  // ),
                ),
              )
            : const SettingsScreen(),
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
            onDestinationSelected: (int index) => setState(() {
              currentIndex = index;
            }),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
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

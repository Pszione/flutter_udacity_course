import 'package:flutter/material.dart';
import 'package:flutter_udacity_course/components/category.dart';
import 'package:google_fonts/google_fonts.dart';

import 'categories_section.dart';

void main() {
  runApp(const UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: Scaffold(
        //backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: const Text('Unit Converter'),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: true,
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.zero,
            child: CategoriesRoute(),
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
        colorScheme: appDarkColorScheme,
        primaryColor: kDarkBackgroundColor,
        primaryColorDark: kWhiteColor,
        scaffoldBackgroundColor: kDarkBackgroundColor,
        backgroundColor: kDarkBackgroundColor,
        dialogBackgroundColor: kSecondaryColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    );
  }

  static ColorScheme appDarkColorScheme = const ColorScheme.dark(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    primaryVariant: kPrimaryColor,
    secondaryVariant: kComplementaryColor,
    surface: kDarkBackgroundColor,
    background: kDarkBackgroundColor,
  );
}

// temporarily placed here
const kPrimaryColor = Color(0xFF1A73E9);
const kSecondaryColor = Color(0xffff7b67);
const kTertiaryColor = Color(0xfffcd76b);
const kComplementaryColor = Color(0xff00444f);
const kDarkBackgroundColor = Color(0xff343a44);
const kWhiteColor = Colors.white;
const kDarkColor = Color(0xFF191923);
const kGrayColor = Color(0xFFD8D8D8);

const kHugePadding = 33.0;
const kDefaultPadding = 20.0;
const kDefaultRowSpacing = kDefaultPadding * 1.5;
const kHalfPadding = kDefaultPadding / 2;
const kMediumPadding = kDefaultPadding / 1.5;
const kSmallPadding = kDefaultPadding / 3;
var kHugeBorderRadius = BorderRadius.circular(28);
var kDefaultBorderRadius = BorderRadius.circular(kDefaultBorderRadiusAsDouble);
const kDefaultBorderRadiusAsDouble = 20.0;
const kSmallBorderRadiusAsDouble = 16.0;
const kSplashRadius = 85.0;

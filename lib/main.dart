import 'package:flutter/material.dart';
import 'package:flutter_udacity_course/constants.dart';
import 'package:flutter_udacity_course/help_screen.dart';
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
      home: WillPopScope(
        onWillPop: () {
          if (currentIndex > 0) {
            setState(() => currentIndex--);
          }
          return Future.value(false); // prevent exiting app
        },
        child: Scaffold(
          //backgroundColor: Colors.green[100],
          appBar: const AppBarCustom(
            title: kAppName,
          ),
          body: Material(
            type: MaterialType.transparency,
            child: currentIndex == 0
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
          ),
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              child: Text(
                '?',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HelpScreen(),
                  )),
              tooltip: 'Help button',
            );
          }),
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
                  const IconThemeData(size: kCategorySmallIconSize * 0.85),
                )),
            child: NavigationBar(
              selectedIndex: currentIndex,
              onDestinationSelected: (int index) => setState(() {
                currentIndex = index;
              }),
              animationDuration: const Duration(seconds: 1, milliseconds: 100),
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              destinations: const [
                NavigationDestination(
                  icon: Icon(
                    FontAwesomeIcons.rulerCombined,
                  ),
                  selectedIcon: Icon(FontAwesomeIcons.ruler),
                  label: 'Conversions',
                  tooltip: 'Unit conversions list',
                ),
                NavigationDestination(
                  icon: Icon(
                    FontAwesomeIcons.cog,
                    size: kCategorySmallIconSize,
                  ),
                  selectedIcon: Icon(FontAwesomeIcons.userCog),
                  label: 'Settings',
                  tooltip: 'More settings',
                ),
              ],
            ),
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
        highlightColor: kSecondaryColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    );
  }
}

// TODO: test this method
Future<T?> pushScreen<T>(BuildContext context, Widget screen) {
  return Navigator.of(context)
      .push<T>(MaterialPageRoute(builder: (_) => screen));
}

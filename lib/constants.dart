import 'package:flutter/material.dart';

import 'main.dart';

const kPrimaryColor = Color(0xFF1A73E9);
const kSecondaryColor = Color(0xffff7b67);
const kTertiaryColor = Color(0xfffcd76b);
const kComplementaryColor = Color(0xff00444f);
const kDarkBackgroundColor = Color(0xff343a44);
const kWhiteColor = Colors.white;
const kDarkColor = Color(0xFF191923);
const kGrayColor = Color(0xFFD8D8D8);

const ColorScheme kAppDarkColorScheme = ColorScheme.dark(
  primary: kPrimaryColor,
  secondary: kSecondaryColor,
  primaryVariant: kPrimaryColor,
  secondaryVariant: kComplementaryColor,
  surface: kDarkBackgroundColor,
  background: kDarkBackgroundColor,
);

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

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({Key? key, required this.title, this.color})
      : super(key: key);

  final String? title;
  final Color? color;

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? kAppName),
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: true,
      backgroundColor: color,
    );
  }
}

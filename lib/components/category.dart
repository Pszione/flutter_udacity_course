import 'package:flutter/material.dart';
import 'package:flutter_udacity_course/converter_screen.dart';

import '../constants.dart';
import '../unit.dart';

const rowHeight = 80.0;
final borderRadius = kHugeBorderRadius;

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
    required this.units,
  }) : super(key: key);
  final String label;
  final Color? color;
  final IconData icon;
  final List<Unit> units;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: rowHeight,
        child: InkWell(
          onTap: () {
            print('I was tapped!');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UnitConverterScreen(
                        unitName: label,
                        unitColor: color,
                        units: units,
                      )),
            );
          },
          borderRadius: borderRadius,
          highlightColor: color,
          splashColor: color,
          radius: kSplashRadius * 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kHalfPadding),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kHalfPadding),
                  child: Icon(
                    icon,
                    size: kCategoryIconSize,
                  ),
                ),
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kHalfPadding),
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

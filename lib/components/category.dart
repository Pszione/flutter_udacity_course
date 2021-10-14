import 'package:flutter/material.dart';

import '../constants.dart';

const _rowHeight = 80.0;
final _borderRadius = kHugeBorderRadius;

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
  }) : super(key: key);
  final String label;
  final Color? color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: _rowHeight,
        child: InkWell(
          onTap: () {
            print('I was tapped!');
          },
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          radius: kSplashRadius,
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
                    size: 50,
                  ),
                ),
                Center(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
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

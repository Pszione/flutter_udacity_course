import 'package:flutter/material.dart';
import 'package:flutter_udacity_course/constants.dart';
import 'package:flutter_udacity_course/unit.dart';

class UnitConverterScreen extends StatelessWidget {
  const UnitConverterScreen(
      {Key? key, this.unitName, this.unitColor, required this.units})
      : super(key: key);

  final String? unitName;
  final Color? unitColor;
  final List<Unit> units;

  @override
  Widget build(BuildContext context) {
    //
    final unitWidgets = units.map((Unit unit) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name!,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBarCustom(
        title: unitName,
        color: unitColor,
      ),
      body: ListView(
        children: unitWidgets,
      ),
    );
  }
}

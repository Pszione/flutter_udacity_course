import 'package:flutter/material.dart';
import 'package:flutter_udacity_course/constants.dart';

class UnitConverterScreen extends StatelessWidget {
  const UnitConverterScreen({Key? key, this.unitLabel, this.unitColor})
      : super(key: key);

  final String? unitLabel;
  final Color? unitColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: unitLabel,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryModel {
  static const categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
    'Birthday Cake',
    'Pedross',
  ];

  static const baseColors = <Color>[
    Colors.teal,
    Colors.greenAccent,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.purpleAccent,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.white,
  ];

  static const categoryIcons = <IconData>[
    FontAwesomeIcons.ruler,
    FontAwesomeIcons.chartArea,
    FontAwesomeIcons.bitbucket,
    FontAwesomeIcons.weight,
    FontAwesomeIcons.clock,
    FontAwesomeIcons.hdd,
    FontAwesomeIcons.lightbulb,
    FontAwesomeIcons.dollarSign,
    FontAwesomeIcons.birthdayCake,
    FontAwesomeIcons.radiationAlt,
  ];
}

import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      type: MaterialType.card, // TODO
      child: SafeArea(
        child: Center(
          child: Text(
            'Need any help?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 64),
          ),
        ),
      ),
    );
  }
}

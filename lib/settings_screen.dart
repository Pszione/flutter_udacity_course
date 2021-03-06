import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Center(
          child: Text(
            'Settings',
            style: TextStyle(fontSize: 64),
          ),
        ),
      ),
    );
  }
}

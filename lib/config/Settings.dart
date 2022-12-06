import 'package:bmi_calculator/config/UserSettings.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  void onPressed(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserSettings()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => onPressed(context),
          child: const Text('User Settings'),
        ),
      ),
    );
  }
}
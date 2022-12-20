import 'package:bmi_calculator/preferences/UserPreferences.dart';
import 'package:flutter/material.dart';

import '../services/BmiDto.dart';

class BMIResult extends StatelessWidget {
  BMIResult({super.key, required this.bmiDto});

  final BmiDto bmiDto;
  final Future<String?> _currentUser = UserPreferences.loadUser();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show result"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // horizontale Ausrichtung innerhalb der Column
          mainAxisSize: MainAxisSize.min, // vertikale Ausrichtung
          children: [
            FutureBuilder(future: _currentUser,builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Text("Logged in User: ${snapshot.data}");
              }
              else {
                return const Text("No user logged in.");
              }
            }),
            Text("BMI result:"), Text(bmiDto.bmiForForm), Text(bmiDto.bmiCategory.text)],
        )
      )
    );
  }
}
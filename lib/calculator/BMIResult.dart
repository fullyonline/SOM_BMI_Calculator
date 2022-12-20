import 'package:flutter/material.dart';

import '../services/BmiDto.dart';

class BMIResult extends StatelessWidget {
  const BMIResult({super.key, required this.bmiDto});

  final BmiDto bmiDto;

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
          children: [Text("BMI result:"), Text(bmiDto.bmiForForm), Text(bmiDto.bmiCategory.text)],
        )
      )
    );
  }
}
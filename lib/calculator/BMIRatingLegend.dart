import 'package:bmi_calculator/utils/BMICategories.dart';
import 'package:flutter/material.dart';

class BMIRatingLegend extends StatelessWidget {
  var _legendElements = <String>[];

  BMIRatingLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI legend'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: BMICategories.values.length,
          itemBuilder: (context, i) {
            _legendElements = BMICategories.values.map((e) => e.text).toList();
            return ListTile(
              title: Text(
                _legendElements[i],
              )
            );
          }
      )
    );
  }
}
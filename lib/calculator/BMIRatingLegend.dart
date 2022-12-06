import 'package:bmi_calculator/calculator/BMIRatingDetail.dart';
import 'package:bmi_calculator/utils/BMICategories.dart';
import 'package:flutter/material.dart';

class BMIRatingLegend extends StatelessWidget {
  var _legendElements = <String>[];

  BMIRatingLegend({super.key});

  @override
  Widget build(BuildContext context) {
    var bmiCategories = BMICategories.values;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI legend'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: bmiCategories.length,
          itemBuilder: (context, i) {
            _legendElements = bmiCategories.map((e) => e.text).toList();
            return ListTile(
              title: Text(
                _legendElements[i],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BMIRatingDetail(bmiCategory: bmiCategories[i]),
                ));
              },
            );
          }
      )
    );
  }
}
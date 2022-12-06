import 'package:bmi_calculator/utils/BMICategories.dart';
import 'package:flutter/material.dart';

class BMIRatingDetail extends StatelessWidget {
  const BMIRatingDetail({super.key, required this.bmiCategory});

  final BMICategories bmiCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating detail'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text(bmiCategory.text),
        ),
      ),
    );
  }
}
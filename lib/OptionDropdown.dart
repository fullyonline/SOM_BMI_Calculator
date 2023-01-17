import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'calculator/BMIRatingLegend.dart';
import 'config/Settings.dart';

class OptionDropdown extends StatelessWidget {
  const OptionDropdown({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Text("BMI Legend"),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text("Settings"),
              ),
            ];
          },
          onSelected: (value) {
            switch(value) {
              case 0: {
                print("BMI Legend menu is selected.");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BMIRatingLegend()),
                );
              }
              break;
              case 1: {
                print("Settings menu is selected.");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              }
              break;
            }
          },
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                child: Text(AppLocalizations.of(context)!.bmiLegend),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text(AppLocalizations.of(context)!.settings),
              ),
            ];
          },
          onSelected: (value) {
            switch(value) {
              case 0: {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BMIRatingLegend()),
                );
              }
              break;
              case 1: {
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
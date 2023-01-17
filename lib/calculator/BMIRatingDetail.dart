import 'package:bmi_calculator/utils/BMICategories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BMIRatingDetail extends StatelessWidget {
  const BMIRatingDetail({super.key, required this.bmiCategory});

  final BMICategories bmiCategory;

  @override
  Widget build(BuildContext context) {
    final _biggerFont = const TextStyle(fontSize: 30);
    final _upperLimit = bmiCategory.upperLimit > 100 ? AppLocalizations.of(context)!.infinite : bmiCategory.upperLimit.toString();
    final _lowerLimit = bmiCategory.lowerLimit < 0.1 ? "0.0" : bmiCategory.lowerLimit.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating detail'),
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // horizontale Ausrichtung innerhalb der Column
            mainAxisSize: MainAxisSize.min, // vertikale Ausrichtung
            children: [
              Text(
                AppLocalizations.of(context)!.ratingDetails,
                style: _biggerFont,
              ),
              Text(AppLocalizations.of(context)!.description),
              Text(bmiCategory.text),
              Text(AppLocalizations.of(context)!.upperLimit + _upperLimit),
              Text(AppLocalizations.of(context)!.lowerLimit + _lowerLimit),
            ],
        )

      ),
    );
  }
}
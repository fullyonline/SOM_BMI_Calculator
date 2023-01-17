import 'package:bmi_calculator/preferences/UserPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../services/BmiDto.dart';
import '../OptionDropdown.dart';

class BMIResult extends StatelessWidget {
  BMIResult({super.key, required this.bmiDto});

  final BmiDto bmiDto;
  final Future<String?> _currentUser = UserPreferences.loadUser();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.showResult),
          actions: const [OptionDropdown()]
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // horizontale Ausrichtung innerhalb der Column
          mainAxisSize: MainAxisSize.min, // vertikale Ausrichtung
          children: [
            FutureBuilder(future: _currentUser,builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Text("${AppLocalizations.of(context)!.loggedInUser}: ${snapshot.data}");
              }
              else {
                return Text(AppLocalizations.of(context)!.noUserLoggedIn);
              }
            }),
            Text(AppLocalizations.of(context)!.bmiResult), Text(bmiDto.bmiForForm), Text(bmiDto.bmiCategory.text)],
        )
      )
    );
  }
}
import 'package:bmi_calculator/config/UserSettings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  void onPressed(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserSettings()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => onPressed(context),
          child: Text(AppLocalizations.of(context)!.userSettings),
        ),
      ),
    );
  }
}
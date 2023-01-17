import 'package:bmi_calculator/calculator/BMIInput.dart';
import 'package:bmi_calculator/OptionDropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MyHomePage(title: 'BMI App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  void onPressed(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BmiInput()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.labelBmi),
        actions: const [OptionDropdown()]
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Center(
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.center, // horizontale Ausrichtung innerhalb der Column
            mainAxisSize: MainAxisSize.min, // vertikale Ausrichtung
            children: [
              Text(AppLocalizations.of(context)!.labelBmiText),
              TextButton(
                  onPressed: () => onPressed(context),
                  child: Text(AppLocalizations.of(context)!.labelGoToCalc)
              )
            ],
          ),
        ),
      ),
    );
  }
}

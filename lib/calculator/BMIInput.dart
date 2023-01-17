import 'package:bmi_calculator/services/BmiDto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../OptionDropdown.dart';
import 'BMIResult.dart';

class BmiInput extends StatefulWidget {
  const BmiInput({super.key});

  @override
  BmiInputState createState() {
    return BmiInputState();
  }
}

class BmiInputState extends State<BmiInput> {
  final _formKey = GlobalKey<FormState>();
  final heightController = TextEditingController();
  final weightController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.labelCalculator), actions: const [OptionDropdown()]),
        body: Container(
            margin: const EdgeInsets.all(30),
            child: Center(
                child: SizedBox(
                    width: 400,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // horizontale Ausrichtung innerhalb der Column
                        mainAxisSize: MainAxisSize.min,
                        // vertikale Ausrichtung
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.hintTextHeight,
                              labelText: AppLocalizations.of(context)!.labelTextHeight
                            ),
                            keyboardType: TextInputType.number,
                            controller: heightController,
                            validator: (String? value) {
                              return (value != null &&
                                      value.isNotEmpty &&
                                      double.tryParse(value) != null)
                                  ? null
                                  : AppLocalizations.of(context)!.heightcontrollerValidatorError;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.hintTextWeight,
                              labelText: AppLocalizations.of(context)!.labelTextWeight,
                            ),
                            keyboardType: TextInputType.number,
                            controller: weightController,
                            validator: (String? value) {
                              return (value != null &&
                                      value.isNotEmpty &&
                                      double.tryParse(value) != null)
                                  ? null
                                  : AppLocalizations.of(context)!.weightcontrollerValidatorError;
                            },
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // horizontale Ausrichtung innerhalb der Column
                              mainAxisSize: MainAxisSize.min,
                              // vertikale Ausrichtung
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      heightController.text = "";
                                      weightController.text = "";
                                    },
                                    child: Text(AppLocalizations.of(context)!.clearAllValues),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      int? height = int.tryParse(
                                          heightController.value.text);
                                      int? weight = int.tryParse(
                                          weightController.value.text);
                                      if (_formKey.currentState!.validate() &&
                                          height != null &&
                                          weight != null) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => BMIResult(
                                                    bmiDto: BmiDto(
                                                        height, weight))));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  AppLocalizations.of(context)!.weightAndHeightError)),
                                        );
                                      }
                                    },
                                    child: Text(AppLocalizations.of(context)!.labelCalculate),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )))));
  }
}

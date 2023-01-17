import 'package:bmi_calculator/services/BmiDto.dart';
import 'package:flutter/material.dart';

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
          title: Text("Calculator"),
          actions: const [OptionDropdown()]
      ),
      body: Center(
          child: SizedBox(
            width: 400,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // horizontale Ausrichtung innerhalb der Column
                mainAxisSize: MainAxisSize.min, // vertikale Ausrichtung
                children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Height in cm',
                    labelText: 'Height *',
                  ),
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  validator: (String? value) {
                    return (value != null && value.isNotEmpty && double.tryParse(value) != null) ? null : "Enter valid number";
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Weight in kg',
                    labelText: 'Weight *',
                  ),
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  validator: (String? value) {
                    return (value != null && value.isNotEmpty && double.tryParse(value) != null) ? null : "Enter valid number";
                  },
                ),
                  ElevatedButton(
                    onPressed: () {
                      int? height = int.tryParse(heightController.value.text);
                      int? weight = int.tryParse(weightController.value.text);
                      if (_formKey.currentState!.validate() && height != null && weight != null) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BMIResult(bmiDto: BmiDto(height, weight))));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill in the width and height.')),
                        );
                      }
                    },
                    child: const Text('Calculate'),
                  ),
              ],
            ),
          )
        )
      )
    );
  }
}
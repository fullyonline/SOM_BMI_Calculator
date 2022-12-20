import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final widthController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    heightController.dispose();
    widthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
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
                  controller: heightController,
                  validator: (String? value) {
                    return (value != null && value.isNotEmpty && double.tryParse(value) != null) ? null : "Enter valid number";
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Width in cm',
                    labelText: 'Width *',
                  ),
                  controller: widthController,
                  validator: (String? value) {
                    return (value != null && value.isNotEmpty && double.tryParse(value) != null) ? null : "Enter valid number";
                  },
                )
              ],
            ),
          )
        )
      )
    );
  }
}
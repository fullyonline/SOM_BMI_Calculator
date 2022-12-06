import 'package:bmi_calculator/bmiInput.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        title: const Text("Body Mass Index"),
      ),
      body: Center(
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.center, // horizontale Ausrichtung innerhalb der Column
          mainAxisSize: MainAxisSize.min, // vertikale Ausrichtung
          children: [Text("Body mass index (BMI) is a value derived from the mass (weight) and height of a person. The BMI is defined as the body mass divided by the square of the body height, and is expressed in units of kg/m2, resulting from mass in kilograms and height in metres."), TextButton(onPressed: () => onPressed(context), child: Text("Go to BMI Calculator"))],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiInput extends StatelessWidget {
  const BmiInput({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Center(
          child: Text("Neue Seite")
      ),
    );
  }
}
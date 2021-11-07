
import 'package:calculator1/inputpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}
class Calculator extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}







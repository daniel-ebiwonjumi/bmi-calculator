import 'package:bmi_calculator1/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bmi_calculator());
}

class Bmi_calculator extends StatelessWidget {
  const Bmi_calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
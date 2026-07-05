import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator', style: TextStyle(fontSize: 40)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Column(
          children: [
            TextField(
              controller: tfweight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Please input your weight",
                labelText: "Weight",
                suffixText: 'Kg',
                prefixIcon: Icon(Icons.person, color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: tfheight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Please input your height",
                labelText: "Height",
                suffixText: 'cm',
                prefixIcon: Icon(Icons.person, color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: computeBmi,
                    child: Text(
                      'Compute',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.blue,
              child: Text(output, style: TextStyle(fontSize: 32)),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(color: Colors.deepPurple),

              child: Text(category, style: TextStyle(fontSize: 32)),
            ),
          ],
        ),
      ),
    );
  }

  void computeBmi() {
    double weight = double.parse(tfweight.text);
    double height = double.parse(tfheight.text);
    double bmi = weight / pow(height / 100, 2);
    setState(() {
      output = 'Your BMI is: $bmi';
      if (bmi < 16) {
        category = "  Category: Severely Underweight  ";
      } else if (bmi < 18.5) {
        category = "  Category:  Underweight  ";
      } else if (bmi < 25) {
        category = "  Category: Normal  ";
      } else if (bmi < 30) {
        category = "  Category: Overweight  ";
      } else if (bmi < 35) {
        category = "  Category: Obese  ";
      } else if (bmi >= 35) {
        category = "  Category: Very obese, seek medical attention  ";
      }
    });
  }

  TextEditingController tfweight = TextEditingController();
  TextEditingController tfheight = TextEditingController();
  String output = 'The result will be displayed here';
  String category = '  Category:   ';
}

import 'package:bmi_calculator_app/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.blue,
          )),
          Expanded(
              child: Container(
            color: Colors.red,
          )),
          Expanded(
              child: Container(
            color: Colors.green,
          )),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BmiResultScreen(),
                ),
              );
            },
            child: Container(
              height: 60,
              color: Colors.blue,
              child: const Center(child: Text('BMI Data')),
            ),
          ),
        ],
      ),
    );
  }
}

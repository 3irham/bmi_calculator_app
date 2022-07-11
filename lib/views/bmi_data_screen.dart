import 'package:bmi_calculator_app/constants/constant.dart';
import 'package:bmi_calculator_app/views/bmi_result_screen.dart';
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
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff272A4E),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          size: 80,
                        ),
                        Text(
                          'Male',
                          style: genderTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff272A4E),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          size: 80,
                        ),
                        Text(
                          'Female',
                          style: genderTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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

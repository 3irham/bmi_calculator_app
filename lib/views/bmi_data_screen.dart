import 'dart:math';

import 'package:bmi_calculator_app/constants/constant.dart';
import 'package:bmi_calculator_app/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 125;
  int weight = 50;
  int age = 20;
  String? gender;

  double calculateBmi() {
    double heightInMeter = height / 100;
    final h = pow(heightInMeter, 2);
    final bmi = weight / h;
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 'male';
                      });
                    },
                    child: BMICard(
                        borderColor:
                            (gender == 'male') ? Colors.white : primaryColor,
                        child: const GenderIconText(
                            title: 'Male', icon: Icons.male)),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 'female';
                      });
                    },
                    child: BMICard(
                      borderColor:
                          (gender == 'female') ? Colors.white : primaryColor,
                      child: const GenderIconText(
                        title: 'Female',
                        icon: Icons.female,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: BMICard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: labelTextStyle?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ('$height'),
                      style: numberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: labelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 50,
                  max: 250,
                  thumbColor: Colors.red,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      height = value.toInt();
                    });
                  },
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: numberTextStyle,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              shape: const CircleBorder(),
                              elevation: 0,
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              shape: const CircleBorder(),
                              elevation: 0,
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          '$age',
                          style: numberTextStyle,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              shape: const CircleBorder(),
                              elevation: 0,
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              shape: const CircleBorder(),
                              elevation: 0,
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // print(calculateBmi());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BmiResultScreen(bmi: calculateBmi()),
                ),
              );
            },
            child: Container(
              height: 80,
              color: Colors.red,
              child: const Center(
                child: Text(
                  'Hitung BMI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BMICard extends StatelessWidget {
  const BMICard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xff272A4E),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor!),
        ),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}

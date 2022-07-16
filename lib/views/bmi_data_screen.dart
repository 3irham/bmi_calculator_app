import 'dart:math';

import 'package:bmi_calculator_app/constants/constant.dart';
import 'package:bmi_calculator_app/helpers/bmi_calculator.dart';
import 'package:bmi_calculator_app/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
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

  // double calculateBmi() {
  //   double heightInMeter = height / 100;
  //   final h = pow(heightInMeter, 2);
  //   final bmi = weight / h;
  //   return bmi;
  // }

  List<Widget> generateList(sr, ed) {
    List<Widget> weights = [];
    for (int i = sr; i <= ed; i++) {
      weights.add(
        Text(
          '$i',
          style: labelTextStyle?.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }
    return weights;
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
          Row(
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
          Column(
            children: [
              Text(
                'HEIGHT',
                style: labelTextStyle?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: BMICard(
                        child: Slider(
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
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          ('$height'),
                          style: labelTextStyle,
                        ),
                        Text(
                          ' cm',
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'WEIGHT',
                      style: labelTextStyle,
                    ),
                    BMICard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: CupertinoPicker(
                              itemExtent: 25,
                              scrollController: FixedExtentScrollController(
                                initialItem: 40,
                              ),
                              magnification: 2,
                              useMagnifier: true,
                              onSelectedItemChanged: (val) {
                                // print(val);
                                weight = val;
                              },
                              children: generateList(0, 250),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'AGE',
                      style: labelTextStyle,
                    ),
                    BMICard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: CupertinoPicker(
                              itemExtent: 25,
                              scrollController: FixedExtentScrollController(
                                initialItem: 20,
                              ),
                              magnification: 2,
                              useMagnifier: true,
                              onSelectedItemChanged: (val) {
                                // print(val);
                                weight = val;
                              },
                              children: generateList(0, 90),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // print(calculateBmi());
              final bmiCalculator =
                  BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculateBmi();

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return BmiResultScreen(
                    bmi: bmiCalculator.bmi!,
                  );
                }),
              );
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Hitung BMI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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

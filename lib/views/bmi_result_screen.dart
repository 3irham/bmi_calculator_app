import 'package:bmi_calculator_app/constants/constant.dart';
import 'package:bmi_calculator_app/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key, required this.bmi});
  final double bmi;

  String determineBmiCategory(double bmiValue) {
    String category = '';
    if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if (bmiValue < 17) {
      category = underweightModerate;
    } else if (bmiValue < 18.5) {
      category = underweightMild;
    } else if (bmiValue < 25) {
      category = normal;
    } else if (bmiValue < 30) {
      category = overweight;
    } else if (bmiValue < 35) {
      category = obeseI;
    } else if (bmiValue < 40) {
      category = obeseII;
    } else if (bmiValue >= 40) {
      category = obeseIII;
    }
    return category;
  }

  String getHealRiskDescription(String categoryName) {
    String desc = '';
    switch (categoryName) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = 'Possible nutritional deficiency and osteoporosis';
        break;
      case normal:
        desc = 'Low risk (healthy range)';
        break;
      case overweight:
        desc =
            'Moderate risk of developing heart disease, high blood pressure, and diabetes';
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            'High risk of developing heart disease, high blood pressure, and diabetes';
        break;
      default:
    }
    return desc;
  }

  @override
  Widget build(BuildContext context) {
    final String bmiCategory = determineBmiCategory(bmi);
    final String bmiDescription = getHealRiskDescription(bmiCategory);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Hasil Perhitungan BMI',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SizedBox(
              width: double.infinity,
              child: BMICard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          bmiCategory,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          bmi.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 95,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          bmiDescription,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              color: Colors.red,
              child: const Center(
                child: Text(
                  'Hitung Ulang',
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

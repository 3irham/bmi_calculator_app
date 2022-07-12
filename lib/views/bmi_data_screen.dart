import 'package:bmi_calculator_app/constants/constant.dart';
import 'package:bmi_calculator_app/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;

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
              children: const [
                Expanded(
                  child: BMICard(
                      child: GenderIconText(title: 'Male', icon: Icons.male)),
                ),
                Expanded(
                  child: BMICard(
                    child: GenderIconText(
                      title: 'Female',
                      icon: Icons.female,
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
                          'Weight',
                          style: labelTextStyle,
                        ),
                        Text(
                          '80',
                          style: numberTextStyle,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {},
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              shape: const CircleBorder(),
                              elevation: 0,
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                            ),
                            RawMaterialButton(
                              onPressed: () {},
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              shape: const CircleBorder(),
                              elevation: 0,
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
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
                          'Age',
                          style: labelTextStyle,
                        ),
                        Text(
                          '24',
                          style: numberTextStyle,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {},
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              shape: const CircleBorder(),
                              elevation: 0,
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                            ),
                            RawMaterialButton(
                              onPressed: () {},
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              shape: const CircleBorder(),
                              elevation: 0,
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BmiResultScreen(),
                ),
              );
            },
            child: Container(
              height: 60,
              color: Colors.red,
              child: Center(
                child: Text(
                  'BMI Data',
                  style: labelTextStyle,
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
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xff272A4E),
          borderRadius: BorderRadius.circular(15),
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

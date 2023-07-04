import 'resultScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'IconContent.dart';
import 'constants.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InputPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF111328),
        appBarTheme: const AppBarTheme(
          backgroundColor: cardColor,
        ),
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 150;
  int weight = 50;
  int age = 50;

  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: reuseable_card(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardChild:
                      IconContent(icon: FontAwesomeIcons.mars, label: 'Male'),
                  color: (selectedGender == Gender.male)
                      ? selectedCardColor
                      : cardColor,
                ),
              ),
              Expanded(
                child: reuseable_card(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.venus, label: 'Female'),
                  color: (selectedGender == Gender.female)
                      ? selectedCardColor
                      : cardColor,
                ),
              ),
            ],
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reuseable_card(
                    color: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Height',
                          style: labelTextStyle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: values,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'CM',
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 0.0,
                          max: 400.0,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white54,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reuseable_card(
                    color: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: values,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Colors.white,
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                }); // Add your desired functionality here
                              },
                              backgroundColor: Colors.white,
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reuseable_card(
                    color: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: values,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                }); // Add your desired functionality here
                              },
                              backgroundColor: Colors.white,
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                }); // Add your desired functionality here
                              },
                              backgroundColor: Colors.white,
                              child: const Icon(Icons.add),
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
              CalculatorBrain calculatorBrain =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    bmiResult: calculatorBrain.calculateBMI(),
                    resultText: calculatorBrain.getResult(),
                    advice: calculatorBrain.suggestion(),
                  ),
                ),
              );
              setState(() {});
            },
            child: Container(
              height: bottomContainHeight,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

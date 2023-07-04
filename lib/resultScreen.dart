import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusableCard.dart';
import 'main.dart';

class ResultScreen extends StatelessWidget {
   ResultScreen({required this.bmiResult, required this.resultText, required this.advice});
  final String bmiResult;
  final String resultText;
  final String advice;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI CALCULATOR',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 20,
            ),

          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 15), // Add padding of 16 pixels on all sides
                  child: const Text(
                    'RESULT',
                    style: resultPage,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                child: reuseable_card(
                  color: cardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Text(
                       resultText,
                        style: const TextStyle(
                          color: Color(0xFF24D876),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiResult,
                        style: const TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        advice,

                        style: const TextStyle(
                          fontSize: 20.0,

                        ),
                        textAlign: TextAlign.center,

                      ),

                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                height: bottomContainHeight,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'RE-CALCULATE',
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
      ),
    );
  }
}

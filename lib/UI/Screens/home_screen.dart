import 'dart:math';

import 'package:calculator/UI/Screens/calculator_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String resText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 25, 25),
        title: Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                resText,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27),
              ),
            ],
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(text: "x²", onButtonClick: onDigitClick),
                CalculatorButton(
                    text: "√x", onButtonClick: calculateSquareRoot),
                CalculatorButton(text: "%", onButtonClick: onDigitClick),
                CalculatorButton(text: "C", onButtonClick: onClearPressed),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(text: "7", onButtonClick: onDigitClick),
                CalculatorButton(text: "8", onButtonClick: onDigitClick),
                CalculatorButton(text: "9", onButtonClick: onDigitClick),
                CalculatorButton(text: "/", onButtonClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(text: "4", onButtonClick: onDigitClick),
                CalculatorButton(text: "5", onButtonClick: onDigitClick),
                CalculatorButton(text: "6", onButtonClick: onDigitClick),
                CalculatorButton(text: "X", onButtonClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(text: "1", onButtonClick: onDigitClick),
                CalculatorButton(text: "2", onButtonClick: onDigitClick),
                CalculatorButton(text: "3", onButtonClick: onDigitClick),
                CalculatorButton(text: "+", onButtonClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(text: ".", onButtonClick: onDigitClick),
                CalculatorButton(text: "0", onButtonClick: onDigitClick),
                CalculatorButton(text: "=", onButtonClick: onEqualClick),
                CalculatorButton(text: "-", onButtonClick: onOperatorClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDigitClick(String text) {
    resText += text;
    setState(() {});
  }

  //////////////////////////////////////////////////////
  String lhs = '';
  String operator = '';

  void onOperatorClick(String clickedOperator) {
    if (operator.isEmpty) {
      lhs = resText;
    } else {
      String rhs = resText;
      lhs = calculate(lhs, rhs, operator);
    }
    operator = clickedOperator;
    resText = '';
    setState(() {});
  }

  ///////////////////////////////////////////////////////
  String calculate(String lhs, String rhs, String operator) {
    double number1 = double.parse(lhs);
    double number2 = double.parse(rhs);
    double res = 0.0;
    if (operator == '+') {
      res = number1 + number2;
    } else if (operator == '-') {
      res = number1 - number2;
    } else if (operator == 'X') {
      res = number1 * number2;
    } else if (operator == '/') {
      res = number1 / number2;
    }
    return res.toString();
  }

  ///////////////////////////////////////////////////////
  void onEqualClick(String text) {
    String rhs = resText;
    resText = calculate(lhs, rhs, operator);
    lhs = '';
    operator = '';
    setState(() {});
  }

  ///////////////////////////////////////////////////////
  void onClearPressed(String text) {
    setState(() {
      resText = '';
    });
  }

  ////////////////////////////////////////////////////////
  String calculateSquareRoot(String text) {
    double number1 = double.parse(text);
    return sqrt(number1).toString();
  }

  // double calculatePowerOfTwo(double number) {
  //   return pow(number, 2);
  // }

  double calculateModulo(double dividend, double divisor) {
    return dividend % divisor;
  }
}

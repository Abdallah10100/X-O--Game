import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String text;
  Function onButtonClick;

  CalculatorButton({required this.text, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(2),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 62, 62, 62),
          ),
          onPressed: () {
            onButtonClick(text);
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )),
    ));
  }
}

import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  String text;

  int index;
  Function onButtonClick;

  GameButton(
      {required this.text, required this.index, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(3),
      child: ElevatedButton(
          onPressed: () {
            onButtonClick(index);
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
    ));
  }
}

import 'package:calculator/xo_game/game_board.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  static const String routeName = "Player-screen";
  String player1Name = '';
  String player2Name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To Route Game"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (text) {
                player1Name = text;
              },
              decoration: InputDecoration(label: Text("Player 1 Name")),
            ),
            TextField(
              onChanged: (text) {
                player2Name = text;
              },
              decoration: InputDecoration(label: Text("Player 2 Name")),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(GameBoard.routeName,
                      arguments: GameBoardArgs(
                          player1Name: player1Name, player2Name: player2Name));
                },
                child: Text("Let's Play"))
          ],
        ),
      ),
    );
  }
}

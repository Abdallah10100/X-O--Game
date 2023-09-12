import 'package:calculator/xo_game/game_button.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  static const String routeName = "Game-board";

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "XO Game",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${args.player1Name} (X): $player1Score",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${args.player2Name} (O): $player2Score",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(
                    text: boardState[0],
                    index: 0,
                    onButtonClick: onButtonClicked),
                GameButton(
                    text: boardState[1],
                    index: 1,
                    onButtonClick: onButtonClicked),
                GameButton(
                    text: boardState[2],
                    index: 2,
                    onButtonClick: onButtonClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(
                    text: boardState[3],
                    index: 3,
                    onButtonClick: onButtonClicked),
                GameButton(
                    text: boardState[4],
                    index: 4,
                    onButtonClick: onButtonClicked),
                GameButton(
                    text: boardState[5],
                    index: 5,
                    onButtonClick: onButtonClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(
                    text: boardState[6],
                    index: 6,
                    onButtonClick: onButtonClicked),
                GameButton(
                    text: boardState[7],
                    index: 7,
                    onButtonClick: onButtonClicked),
                GameButton(
                    text: boardState[8],
                    index: 8,
                    onButtonClick: onButtonClicked),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*
  0 => o
  1 => x
  2 => o
  3 => x
  4 => o
  5 => x
  6 => o
  6 => x
  6 => o
  */

  int counter = 0;

  void onButtonClicked(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    } else if (counter % 2 == 0) {
      boardState[index] = 'X';
    } else {
      boardState[index] = 'O';
    }
    counter++;
    if (checkWinner("X")) {
      player1Score += 5;
      initBoard();
    } else if (checkWinner("O")) {
      player2Score += 5;
      initBoard();
    } else if (counter == 9) {
      initBoard();
    }
    setState(() {});
  }

  /////////////////////////////////////////////////////
  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  //////////////////////////////////////////////////
  void initBoard() {
    boardState = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
  }
}

/// data class
class GameBoardArgs {
  String player1Name;
  String player2Name;

  GameBoardArgs({required this.player1Name, required this.player2Name});
}

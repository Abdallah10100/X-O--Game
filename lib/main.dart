import 'package:calculator/UI/Screens/home_screen.dart';
import 'package:calculator/xo_game/game_board.dart';
import 'package:calculator/xo_game/player_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: PlayerScreen.routeName,
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          GameBoard.routeName: (_) => GameBoard(),
          PlayerScreen.routeName: (_) => PlayerScreen(),
        });
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicey'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    // Everything within the build function will
    // be updated during HotReload!!!

    void updateDice() {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });
    }

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
              // This is called an "anonymous" function (AKA VoidCallback)
              onPressed: updateDice,
              iconSize: 170.0,
              icon: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: updateDice,
              iconSize: 170.0,
              icon: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}

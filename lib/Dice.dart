import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int score1 = 0;
  int score2 = 0;
  int playerOne = 1;
  int playerTwo = 0;
  String result = '';
  int maxChance = 0;
  int count = 0;
  int p = 1;
  Random random = Random();
  void rollDice() {
    setState(() {
      // Randomise the dice //
      playerOne = Random().nextInt(6) + 1;
      if (maxChance < 10) {
        maxChance++;

        if (p == 1) {
          score1 = score1 + playerOne;
          p = 2;
        } else {
          score2 = score2 + playerOne;
          p = 1;
        }
      }

      if (score1 > score2) {
        result = 'Player 1';
      } else if (score2 > score1) {
        result = 'Player 2';
      } else {
        result = 'Draw';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Dice Game"),
          ),
          body: Center(
            child: Column(
              children: [
                const Text(
                  "DICE GAME",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                    splashColor: Colors.lightBlue,
                    child: Container(
                      child: Image.asset("assets/$playerOne.png"),
                    ),
                    onTap: () {
                      setState(() {
                        count++;
                        if (count < 10) {
                          rollDice();
                        }
                      });
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Player 1",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$score1',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Player 2",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          '$score2',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Winner is ${result}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        maxChance = 0;
                        score1 = 0;
                        score2 = 0;
                        result = '';
                        playerOne = 1;
                        count=0;
                      });
                    },
                    child: const Text('Start New Game')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

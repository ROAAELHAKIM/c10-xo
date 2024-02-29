import 'package:flutter/material.dart';
import 'package:newassignment/xo/calc_btn.dart';
import 'package:newassignment/xo/playersmodel.dart';

class xo_game extends StatefulWidget {
  const xo_game({super.key});

  static const String routeName = "XoGame";

  @override
  State<xo_game> createState() => _xo_gameState();
}

class _xo_gameState extends State<xo_game> {
  int score1 = 0;
  int score2 = 0;
  int counter = 1;
  List<String> boredState = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    PlayersModel model =
        ModalRoute.of(context)!.settings.arguments as PlayersModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("xo game"),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      model.player1Name,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "$score1",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      model.player2Name,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "$score2",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w500,),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              calc_btn(label: boredState[0], index: 0, onClick: onBoredClick),
              calc_btn(label: boredState[1], index: 1, onClick: onBoredClick),
              calc_btn(label: boredState[2], index: 2, onClick: onBoredClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              calc_btn(label: boredState[3], index: 3, onClick: onBoredClick),
              calc_btn(label: boredState[4], index: 4, onClick: onBoredClick),
              calc_btn(label: boredState[5], index: 5, onClick: onBoredClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              calc_btn(label: boredState[6], index: 6, onClick: onBoredClick),
              calc_btn(label: boredState[7], index: 7, onClick: onBoredClick),
              calc_btn(label: boredState[8], index: 8, onClick: onBoredClick),
            ],
          ),
        ),
      ]),
    );
  }

  onBoredClick(index) {
    if (boredState[index].isNotEmpty) {
      return;
    }
    if (counter.isOdd) {
      boredState[index] = "X";
      score1 += 2;
      bool win = checkWin("x");
      if (win) {
        score1 += 10;
        resetBoard();
      }
    } else {
      boredState[index] = "O";
      score2 += 2;
      bool win = checkWin("O");
      if (win) {
        score2 += 10;
        resetBoard();
      }
    }
    counter++;
    setState(() {});
  }

  bool checkWin(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (symbol == boredState[i] &&
          symbol == boredState[i + 1] &&
          symbol == boredState[i + 2]) {
        return true;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (symbol == boredState[i] &&
          symbol == boredState[i + 3] &&
          symbol == boredState[i + 6]) {
        return true;
      }
    }

    if (symbol == boredState[0] && //diagonal
        symbol == boredState[4] &&
        symbol == boredState[8]) {
      return true;
    }
    if (symbol == boredState[2] &&
        symbol == boredState[4] &&
        symbol == boredState[6]) {
      return true;
    }
    return false;
  }

  resetBoard() {
    boredState = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    counter = 0;
  }
}

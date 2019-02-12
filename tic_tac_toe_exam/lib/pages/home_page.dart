import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_exam/ui/g_button.dart';
import 'package:tic_tac_toe_exam/ui/message_box.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController tec;
  List<GButton> btnList;
  var player1;
  var player2;
  var activePalyer;
  List<GButton> _makeButton() {
    player1 = List();
    player2 = List();
    activePalyer = 1;

    var gb = <GButton>[
      GButton(id: 1),
      GButton(id: 2),
      GButton(id: 3),
      GButton(id: 4),
      GButton(id: 5),
      GButton(id: 6),
      GButton(id: 7),
      GButton(id: 8),
      GButton(id: 9),
    ];
    return gb;
  }

  void run(GButton btn) {
    setState(() {
      if (activePalyer == 1) {
        btn.text = "X";
        btn.bg = Colors.red;
        activePalyer = 2;
        player1.add(btn.id);
        tec.text = "Player 2";
      } else {
        btn.text = "O";
        btn.bg = Colors.teal;
        activePalyer = 1;
        player2.add(btn.id);
        tec.text = "Player 1";
      }

      btn.enabled = false;

      int winner = checkGame();
      if (winner == -1) {
        if (btnList.every((p) => p.text != "")) {
          showDialog(context: context, builder: (_) => MessageBox("Game over", "Pree the reset", resetGame));
        } else {
          activePalyer == 2 ? autoPlay() : null;
        }
      }
    });
  }

  void autoPlay() {
    var emptyCells = List();
    var list = List.generate(9, (i) => i + 1);
    for (var cellId in list) {
      if (!(player1.contains(cellId) || player2.contains(cellId))) {
        emptyCells.add(cellId);
      }
    }

    var r = Random();
    var rIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[rIndex];
    int i = btnList.indexWhere((p) => p.id == cellID);
    run(btnList[i]);
  }

  int checkGame() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(context: context, builder: (_) => MessageBox("player 1 win", "Press the reset", resetGame));
      } else {
        showDialog(context: context, builder: (_) => MessageBox("player 2 win", "Press the reset", resetGame));
      }
    }

    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    setState(() {
      btnList = _makeButton();
    });
  }

  @override
  void initState() {
    super.initState();
    this.btnList = _makeButton();
    this.tec = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            textAlign: TextAlign.center,
            controller: tec,
            style: TextStyle(fontSize: 40.0, color: Colors.black),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: this.btnList.length,
              itemBuilder: (context, i) => SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      onPressed: btnList[i].enabled ? () => run(btnList[i]) : null,
                      child: Text(
                        btnList[i].text,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      color: btnList[i].bg,
                      disabledColor: btnList[i].bg,
                    ),
                  ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.0, crossAxisSpacing: 9.0, mainAxisSpacing: 9.0),
            ),
          ),
          RaisedButton(
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            color: Colors.red,
            padding: const EdgeInsets.all(20.0),
            onPressed: resetGame,
          )
        ],
      ),
    );
  }
}

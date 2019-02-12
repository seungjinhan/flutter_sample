import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_exam/ui/ttt_button.dart';
import 'package:tic_tac_toe_exam/ui/message_box.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController tec;
  List<TTTBtn> btnList;
  var player1;
  var player2;
  var activePalyer;
  List<TTTBtn> _makeButton() {
    player1 = List();
    player2 = List();
    activePalyer = 1;

    var gb = <TTTBtn>[
      TTTBtn(id: 1),
      TTTBtn(id: 2),
      TTTBtn(id: 3),
      TTTBtn(id: 4),
      TTTBtn(id: 5),
      TTTBtn(id: 6),
      TTTBtn(id: 7),
      TTTBtn(id: 8),
      TTTBtn(id: 9),
    ];
    return gb;
  }

  void run(TTTBtn btn) {
    setState(() {
      if (activePalyer == 1) {
        btn.text = "X";
        btn.bg = Colors.deepOrangeAccent;
        activePalyer = 2;
        player1.add(btn.id);
        tec.text = "Phone";
      } else {
        btn.text = "O";
        btn.bg = Colors.purple;
        activePalyer = 1;
        player2.add(btn.id);
        tec.text = "You";
      }

      btn.enabled = false;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Center(
              child: CircularProgressIndicator(),
            ),
      );

      new Future.delayed(new Duration(seconds: 1), () {
        Navigator.pop(context); //pop dialog

        int winner = checkGame();

        if (winner == -1) {
          if (btnList.every((p) => p.text != "")) {
            showDialog(context: context, builder: (_) => MessageBox("Game over", "again", resetGame));
          } else {
            activePalyer == 2 ? phoneRun() : null;
          }
        }
      });
    });
  }

  void phoneRun() {
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

  int _check(int a, int b, int c) {
    var winner = -1;
    if (player1.contains(a) && player1.contains(b) && player1.contains(c)) {
      winner = 1;
    } else if (player2.contains(a) && player2.contains(b) && player2.contains(c)) {
      winner = 2;
    }

    return winner;
  }

  int checkGame() {
    var winner = -1;

    winner = _check(1, 2, 3);
    if (winner == -1) {
      winner = _check(4, 5, 6);
      if (winner == -1) {
        winner = _check(7, 8, 9);
        if (winner == -1) {
          winner = _check(1, 4, 7);
          if (winner == -1) {
            winner = _check(2, 5, 8);
            if (winner == -1) {
              winner = _check(3, 6, 9);
              if (winner == -1) {
                winner = _check(1, 5, 9);
                if (winner == -1) {
                  winner = _check(3, 5, 7);
                }
              }
            }
          }
        }
      }
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(context: context, builder: (_) => MessageBox("You win", "Press the reset", resetGame));
      } else {
        showDialog(context: context, builder: (_) => MessageBox("Phone win", "Press the reset", resetGame));
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
      tec.text = "You";
    });
  }

  @override
  void initState() {
    super.initState();
    this.btnList = _makeButton();
    this.tec = TextEditingController();
    tec.text = "You";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        centerTitle: true,
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

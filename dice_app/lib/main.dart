import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Dice'),
        backgroundColor: Colors.blueGrey,
      ),
      body: DiceAPP(),
    ),
  ));
}

class DiceAPP extends StatefulWidget {
  const DiceAPP({Key? key}) : super(key: key);

  @override
  _DiceAPPState createState() => _DiceAPPState();
}

class _DiceAPPState extends State<DiceAPP> {
  int Inc_Ldice = 1;
  int Inc_Rdice = 5;
  int Chk_loss = 0;
  void ChangeDiceFace() {
    setState(() {
      Inc_Rdice = Random().nextInt(6) + 1;
      Inc_Ldice = Random().nextInt(6) + 1;
    });
  }

  void CheckWinnner_Loss() {
    if (Inc_Rdice == Inc_Ldice) {
      setState(() {
        Chk_loss = 0;
        showDialog(
            context: context,
            builder: (ctx) {
              return CupertinoAlertDialog(
                title: Text('You Win!'),
                content: Image.asset('images/minions.png'),
              );
            });
      });
    } else if (Chk_loss == 3) {
      setState(() {
        Chk_loss = 0;
        showDialog(
            context: context,
            builder: (ctx) {
              return CupertinoAlertDialog(
                title: Text('You Loss!'),
                content: Image.asset('images/sad_character.png'),
              );
            });
      });
    } else {
      setState(() {
        Chk_loss++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            //flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  ChangeDiceFace();
                  CheckWinnner_Loss();
                },
                child: Image.asset('images/dice$Inc_Ldice.png'),
              ),
            ),
          ),
          Expanded(
            //flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  ChangeDiceFace();
                  CheckWinnner_Loss();
                },
                child: Image.asset(
                  'images/dice$Inc_Rdice.png',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

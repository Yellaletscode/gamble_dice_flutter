import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('GAMBLE DICEE'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  void changeDiceface() {
    rightDiceNumber = Random().nextInt(6) + 1;
    leftDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'GUESS AND WIN',
            style: TextStyle(fontSize: 26, color: Colors.grey.shade900),
          ),
          Row(
            children: [
              Container(
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          changeDiceface();
                          print(leftDiceNumber);
                        });
                      },
                      child: Image.asset(
                        'images/dice$leftDiceNumber.png',
                      ),
                    ),
                  ),
                ),
              ),
              Text('VS'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeDiceface();
                      });
                    },
                    child: Image.asset(
                      'images/dice$rightDiceNumber.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  changeDiceface();
                });
              },
              child: Text('CLICK HERE'),
            ),
          ),
        ],
      ),
    );
  }
}

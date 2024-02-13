import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const Dice());
}

class Dice extends StatelessWidget {
  const Dice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(
            'Dice',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatelessWidget {
  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: DiceImage(
              initialValue: 4,
            ),
          ),
          Expanded(
            child: DiceImage(
              initialValue: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class DiceImage extends StatefulWidget {
  final int initialValue;
  const DiceImage({super.key, required this.initialValue});

  @override
  State<DiceImage> createState() => _DiceImageState();
}

class _DiceImageState extends State<DiceImage> {
  late int diceNumber;
  @override
  void initState() {
    super.initState();
    diceNumber = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          diceNumber = Random().nextInt(6) + 1;
        });
      },
      child: Image(
        image: AssetImage('image/dice$diceNumber.png'),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ExerciseCompleted extends StatefulWidget {
  @override
  _ExerciseCompletedState createState() => _ExerciseCompletedState();
}

class _ExerciseCompletedState extends State<ExerciseCompleted> {
  ConfettiController _controllerTopCenter;

  @override
  void initState() {
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 1));

    super.initState();
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //TOP CENTER - shoot down
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerTopCenter,
              blastDirection: pi / 4,
              maxBlastForce: 2, // set a lower max blast force
              minBlastForce: 1, // set a lower min blast force
              emissionFrequency: 1,
              numberOfParticles: 5, // a lot of particles at once
              gravity: 1,
            ),
          ),
          RaisedButton(
            onPressed: _controllerTopCenter.play,
            child: Text('hello'),
          )
        ],
      ),
    );
  }
}

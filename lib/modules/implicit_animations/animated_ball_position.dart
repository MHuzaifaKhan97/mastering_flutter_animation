import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBallPosition extends StatefulWidget {
  const AnimatedBallPosition({super.key});

  @override
  State<AnimatedBallPosition> createState() => _AnimatedBallPositionState();
}

class _AnimatedBallPositionState extends State<AnimatedBallPosition> {
  final _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.center,
  ];
  int _currentAlignmentIndex = 0;

  void _animateBall() {
    Random random = Random();
    setState(() {
      _currentAlignmentIndex = random.nextInt(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate Position of Ball'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _animateBall,
              child: AnimatedAlign(
                alignment: _alignments[_currentAlignmentIndex],
                duration: Duration(seconds: 1),
                curve: Curves.elasticInOut,
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "Tap to animate",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

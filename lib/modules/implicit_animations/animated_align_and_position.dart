import 'package:flutter/material.dart';

class AnimatedAlignAndPositionExample extends StatefulWidget {
  const AnimatedAlignAndPositionExample({super.key});

  @override
  State<AnimatedAlignAndPositionExample> createState() =>
      _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState
    extends State<AnimatedAlignAndPositionExample> {
  bool _alignedTopLeft = true;
  bool _positionedLeft = true;
  void _changeAlignmentAndPosition() {
    setState(() {
      _alignedTopLeft = !_alignedTopLeft;
      _positionedLeft = !_positionedLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedAlign & AnimatedPositioned'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _changeAlignmentAndPosition,
              child: Container(
                color: Colors.grey.shade200,
                child: AnimatedAlign(
                  alignment: _alignedTopLeft
                      ? Alignment.topLeft
                      : Alignment.bottomRight,
                  duration: Duration(seconds: 1),
                  curve: Curves.elasticInOut,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: _changeAlignmentAndPosition,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    left: _positionedLeft ? 20 : 200,
                    top: 50,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.red;
  double _borderRadius = 0;

  _changeAnimation() {
    setState(() {
      _width = _width == 200 ? 300 : 200;
      _height = _height == 200 ? 100 : 200;
      _color = _color == Colors.red ? Colors.blue : Colors.red;
      _borderRadius = _borderRadius == 0 ? 50 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _changeAnimation,
              child: AnimatedContainer(
                alignment: Alignment.center,
                duration: Duration(seconds: 1),
                curve: Curves.bounceInOut,
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(_borderRadius)),
                child: Text(
                  'Click to animate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

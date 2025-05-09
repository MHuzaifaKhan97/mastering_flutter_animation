import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({super.key});

  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  bool _visible = true;

  void _animate() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Animated Opacity',
        isBack: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _animate,
          child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.1,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: Container(
              alignment: Alignment.center,
              width: 150,
              height: 150,
              color: Colors.green,
              child: Text("Click to animate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

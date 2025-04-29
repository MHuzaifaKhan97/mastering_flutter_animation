import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  double _padding = 10.0;

  void _animate() {
    setState(() {
      _padding = _padding == 10.0 ? 150.0 : 10.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Animated Padding',
        isBack: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _animate,
          child: AnimatedPadding(
            padding: EdgeInsets.all(_padding),
            duration: Duration(seconds: 2),
            curve: Curves.elasticInOut,
            child: Container(
              alignment: Alignment.center,
              width: 150,
              height: 150,
              color: Colors.green,
              child: Text("Click to animate",
                  textAlign: TextAlign.center,
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

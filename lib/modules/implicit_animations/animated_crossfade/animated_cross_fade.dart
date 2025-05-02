import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool _showFirst = true;

  void _toggleCrossFade() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Animated Cross Fade',
        isBack: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleCrossFade,
          child: AnimatedCrossFade(
            firstChild: Container(
              width: 200,
              height: 150,
              color: Colors.teal,
              alignment: Alignment.center,
              child: Text('First Widget',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            secondChild: Container(
              width: 200,
              height: 150,
              color: Colors.deepOrange,
              alignment: Alignment.center,
              child: Text('Second Widget',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            crossFadeState: _showFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 600),
            sizeCurve: Curves.elasticInOut,
          ),
        ),
      ),
    );
  }
}

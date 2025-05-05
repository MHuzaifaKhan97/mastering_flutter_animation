import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class FlutterSequenceAnimation extends StatefulWidget {
  const FlutterSequenceAnimation({super.key});

  @override
  State<FlutterSequenceAnimation> createState() =>
      _FlutterSequenceAnimationState();
}

class _FlutterSequenceAnimationState extends State<FlutterSequenceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _sequenceAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 200),
          from: Duration(seconds: 0),
          to: Duration(seconds: 2),
          tag: 'move',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 1, end: 0),
          from: Duration(seconds: 2),
          to: Duration(seconds: 4),
          tag: 'fade',
        )
        .animate(_controller);

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Flutter Sequence Animation',
        isBack: true,
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _sequenceAnimation['fade'].value,
            child: Container(
              margin: EdgeInsets.only(top: _sequenceAnimation['move'].value),
              width: 100,
              height: 100,
              color: Colors.teal,
            ),
          );
        },
      ),
    );
  }
}

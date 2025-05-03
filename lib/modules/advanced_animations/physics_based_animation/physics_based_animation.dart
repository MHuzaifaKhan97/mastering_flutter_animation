import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class PhysicsBasedAnimation extends StatefulWidget {
  const PhysicsBasedAnimation({super.key});

  @override
  State<PhysicsBasedAnimation> createState() => _PhysicsBasedAnimationState();
}

class _PhysicsBasedAnimationState extends State<PhysicsBasedAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<double> _animation;

  final SpringDescription _spring = SpringDescription(
    mass: 1,
    stiffness: 100,
    damping: 10,
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
  }

  void _startSpringAnimation() {
    final simulation = SpringSimulation(
      _spring,
      0, // start position
      500, // end position
      10, // initial velocity
    );

    _controller.animateWith(simulation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Physics Based Animation',
        isBack: true,
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Center(
            child: Container(
              margin: EdgeInsets.only(top: _controller.value),
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startSpringAnimation,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

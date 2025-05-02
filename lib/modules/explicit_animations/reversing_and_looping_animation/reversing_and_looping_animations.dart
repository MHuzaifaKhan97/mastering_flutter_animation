import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class ReversingAndLoopingAnimations extends StatefulWidget {
  const ReversingAndLoopingAnimations({super.key});

  @override
  State<ReversingAndLoopingAnimations> createState() =>
      _ReversingAndLoopingAnimationsState();
}

class _ReversingAndLoopingAnimationsState
    extends State<ReversingAndLoopingAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 200.0).animate(_controller);

    // Add loop with reverse
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
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
        title: 'Reversing And Looping Animations',
        isBack: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (_, __) => Container(
            width: _animation.value,
            height: _animation.value,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}

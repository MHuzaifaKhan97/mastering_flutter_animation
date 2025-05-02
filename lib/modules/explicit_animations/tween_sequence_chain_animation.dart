import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class TweenSequenceChainAnimation extends StatefulWidget {
  const TweenSequenceChainAnimation({super.key});

  @override
  State<TweenSequenceChainAnimation> createState() =>
      _TweenSequenceChainAnimationState();
}

class _TweenSequenceChainAnimationState
    extends State<TweenSequenceChainAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 100, end: 200),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 200, end: 150),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 150, end: 100),
        weight: 10,
      ),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.repeat(reverse: true);
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
        title: 'Tween Sequence & Chain Animation',
        isBack: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: _animation.value,
              height: _animation.value,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class IntervalPlusStaggeredAnimations extends StatefulWidget {
  const IntervalPlusStaggeredAnimations({super.key});

  @override
  State<IntervalPlusStaggeredAnimations> createState() =>
      _IntervalPlusStaggeredAnimationsState();
}

class _IntervalPlusStaggeredAnimationsState
    extends State<IntervalPlusStaggeredAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );

    _sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.6, curve: Curves.easeInOut),
      ),
    );

    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
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
        title: 'Interval Plus Staggered Animations',
        isBack: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.rotate(
                angle: _rotationAnimation.value * 3.14,
                child: Container(
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  color: Colors.orange,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

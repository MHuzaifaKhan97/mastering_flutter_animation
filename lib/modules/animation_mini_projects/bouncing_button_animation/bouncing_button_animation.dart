import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class BouncingButtonAnimation extends StatefulWidget {
  final double size;
  const BouncingButtonAnimation({super.key, this.size = 120});

  @override
  State<BouncingButtonAnimation> createState() =>
      _BouncingButtonAnimationState();
}

class _BouncingButtonAnimationState extends State<BouncingButtonAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.0,
      upperBound: 0.1,
      vsync: this,
    );

    // _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
    //   CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    // );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Animated Onboarding',
        isBack: true,
      ),
      body: Center(
        child: GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Button Pressed")),
            );
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Transform.scale(
              scale: 1 - _controller.value,
              child: child,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: const Text(
                "Tap Me",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
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
        title: 'Animated Builder',
        isBack: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          child: FlutterLogo(size: 150),
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 3.14,
              child: child,
            );
          },
        ),
      ),
    );
  }
}

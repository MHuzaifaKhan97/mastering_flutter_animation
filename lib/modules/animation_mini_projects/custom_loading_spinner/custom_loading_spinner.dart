import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class CustomLoadingSpinner extends StatefulWidget {
  final double size;
  const CustomLoadingSpinner({super.key, this.size = 120});

  @override
  State<CustomLoadingSpinner> createState() => _CustomLoadingSpinnerState();
}

class _CustomLoadingSpinnerState extends State<CustomLoadingSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(); // Infinite rotation

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
        title: 'Custom Loading Spinner',
        isBack: true,
      ),
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blueAccent,
                width: 6,
              ),
            ),
            child: Center(
              child: Container(
                width: widget.size * 0.4,
                height: widget.size * 0.4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF9D4EDD), // Bold Neon Lavender
                      Color(0xFF00BBF9), // Electric Cyan Pop
                    ],
                  ),
                  shape: BoxShape.circle,
                  // color: Colors.blueAccent,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

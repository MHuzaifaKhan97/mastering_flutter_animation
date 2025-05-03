import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class CustomPainterPlusAnimation extends StatefulWidget {
  const CustomPainterPlusAnimation({super.key});

  @override
  State<CustomPainterPlusAnimation> createState() =>
      _CustomPainterPlusAnimationState();
}

class _CustomPainterPlusAnimationState extends State<CustomPainterPlusAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 150.0).animate(_controller);
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
        title: 'Custom Painter + Animation',
        isBack: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (_, __) {
            return CustomPaint(
              painter: CirclePainter(_animation.value),
              size: Size(10, 10),
            );
          },
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double radius;

  CirclePainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => oldDelegate.radius != radius;
}

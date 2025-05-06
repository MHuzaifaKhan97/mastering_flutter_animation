import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class RippleEffect extends StatefulWidget {
  const RippleEffect({super.key});

  @override
  State<RippleEffect> createState() => _RippleEffectState();
}

class _RippleEffectState extends State<RippleEffect> {
  double radius = 0;
  Offset? tapPosition;

  void _startRipple(TapUpDetails details) {
    setState(() {
      tapPosition = details.localPosition;
      radius = 0;
    });

    Future.delayed(Duration.zero, () {
      setState(() {
        radius = 300;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Ripple Effect',
        isBack: true,
      ),
      body: GestureDetector(
        onTapUp: _startRipple,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(color: Colors.black),
            ),
            if (tapPosition != null)
              AnimatedPositioned(
                left: tapPosition!.dx - radius / 2,
                top: tapPosition!.dy - radius / 2,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: radius,
                  height: radius,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
            const Center(
              child: Text(
                "Tap Anywhere",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}

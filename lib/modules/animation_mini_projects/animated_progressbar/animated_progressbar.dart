import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class AnimatedProgressbar extends StatefulWidget {
  final double size;
  const AnimatedProgressbar({super.key, this.size = 120});

  @override
  State<AnimatedProgressbar> createState() => _AnimatedProgressbarState();
}

class _AnimatedProgressbarState extends State<AnimatedProgressbar>
    with SingleTickerProviderStateMixin {
  double _progress = 0.2;

  void _increaseProgress() {
    setState(() {
      _progress += 0.2;
      if (_progress > 1.0) _progress = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Animated Progress Bar',
        isBack: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomProgressBar(value: _progress),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _increaseProgress,
              child: const Text("Increase"),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final double value;

  const CustomProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0, end: value),
      builder: (context, animatedValue, _) {
        return Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 300,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                ),
                Container(
                  width: 300 * animatedValue,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.blue],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('${(animatedValue * 100).toStringAsFixed(0)}%',
                style: const TextStyle(fontSize: 20)),
          ],
        );
      },
    );
  }
}

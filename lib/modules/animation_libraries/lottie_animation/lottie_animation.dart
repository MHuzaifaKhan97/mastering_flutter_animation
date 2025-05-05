import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class LottieAnimationExample extends StatefulWidget {
  const LottieAnimationExample({super.key});

  @override
  State<LottieAnimationExample> createState() => _LottieAnimationExampleState();
}

class _LottieAnimationExampleState extends State<LottieAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Lottie Animation',
        isBack: true,
      ),
      body: Center(
        child: Lottie.asset("assets/lottie/animation.json",
            height: 300, width: 300, fit: BoxFit.contain),
      ),
    );
  }
}

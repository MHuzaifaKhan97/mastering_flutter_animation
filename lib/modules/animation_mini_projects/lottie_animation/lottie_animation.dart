import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class LottieAnimationWithController extends StatefulWidget {
  const LottieAnimationWithController({super.key});

  @override
  State<LottieAnimationWithController> createState() =>
      _LottieAnimationWithControllerState();
}

class _LottieAnimationWithControllerState
    extends State<LottieAnimationWithController>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _play() => _controller.forward(from: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Scroll Based Animation',
        isBack: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
            'https://assets5.lottiefiles.com/packages/lf20_x62chJ.json',
            controller: _controller,
            onLoaded: (composition) {
              _controller.duration = composition.duration;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _play,
            child: const Text("Play Animation"),
          ),
        ],
      ),
    );
  }
}

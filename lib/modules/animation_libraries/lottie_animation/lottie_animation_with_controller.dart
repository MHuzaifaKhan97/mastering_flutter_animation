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
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Lottie With Controller',
        isBack: true,
      ),
      body: Center(
        child: Column(
          children: [
            Lottie.asset("assets/lottie/giftbox.json",
                controller: animationController),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    animationController?.repeat(reverse: true);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.orange),
                  child: const Text(
                    "Open Gift",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

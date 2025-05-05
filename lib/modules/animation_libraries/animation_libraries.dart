import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/modules/animation_libraries/lottie_animation/lottie_animation.dart';
import 'package:mastering_flutter_animation/modules/animation_libraries/lottie_animation/lottie_animation_with_controller.dart';
import 'package:mastering_flutter_animation/modules/animation_libraries/rive_animation/rive_animation.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';
import 'package:mastering_flutter_animation/widgets/custom_button.dart';

class AnimationLibraries extends StatelessWidget {
  const AnimationLibraries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Animation Libraries',
        isBack: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Rive Animation',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiveAnimationExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Lottie Animation',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LottieAnimationExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Lottie Animation - Controller',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LottieAnimationWithController(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

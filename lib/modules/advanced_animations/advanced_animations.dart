import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/modules/advanced_animations/custom_painter_plus_animation/custom_painter_plus_animation.dart';
import 'package:mastering_flutter_animation/modules/advanced_animations/hero_animation/hero_animation.dart';
import 'package:mastering_flutter_animation/modules/advanced_animations/physics_based_animation/physics_based_animation.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';
import 'package:mastering_flutter_animation/widgets/custom_button.dart';

class AdvancedAnimations extends StatelessWidget {
  const AdvancedAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Advanced Animation',
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
              title: 'Hero Animation',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HeroAnimationExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Custom Painter + Animation',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomPainterPlusAnimation(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Physics Based Animation',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhysicsBasedAnimation(),
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

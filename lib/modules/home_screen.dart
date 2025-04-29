import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/modules/implicit_animations/animated_align_and_position.dart';
import 'package:mastering_flutter_animation/modules/implicit_animations/animated_ball_position.dart';
import 'package:mastering_flutter_animation/modules/implicit_animations/animated_cross_fade.dart';
import 'package:mastering_flutter_animation/modules/implicit_animations/animated_padding.dart';
import 'package:mastering_flutter_animation/modules/implicit_animations/animated_portfolio_card.dart';
import 'package:mastering_flutter_animation/modules/implicit_animations/animated_switcher.dart';
import 'package:mastering_flutter_animation/modules/implicit_animations/tween_animation_builder.dart';
import 'implicit_animations/animated_opacity.dart';
import 'implicit_animations/animated_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mastering Flutter Animation'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Phase 1: Mastering Flutter Animation Concepts',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Text(
              'Implicit Animations:',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Animated Container',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnimatedContainerExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Animated Opacity',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnimatedOpacityExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Animated Padding',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimatedPaddingExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Animated Align & Position',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimatedAlignAndPositionExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Task: Animate Position of Ball',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimatedBallPosition(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Animated Cross Fade',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimatedCrossFadeExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Animated Switcher',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimatedSwitcherExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Tween Animation',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TweenAnimationBuilderExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Animated Portfolio Card',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimatedProfileCard(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const CustomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

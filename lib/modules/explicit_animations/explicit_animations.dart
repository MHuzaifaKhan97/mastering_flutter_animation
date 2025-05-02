import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/modules/explicit_animations/animated_builder/animated_builder.dart';
import 'package:mastering_flutter_animation/modules/explicit_animations/curved_animation/curved_animation.dart';
import 'package:mastering_flutter_animation/modules/explicit_animations/internal_plus_staggered_animations/interval_plus_staggered_animations.dart';
import 'package:mastering_flutter_animation/modules/explicit_animations/reversing_and_looping_animation/reversing_and_looping_animations.dart';
import 'package:mastering_flutter_animation/modules/explicit_animations/transitions_widgets/transition_widgets.dart';
import 'package:mastering_flutter_animation/modules/explicit_animations/tween_sequence_chain_animation/tween_sequence_chain_animation.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';
import 'package:mastering_flutter_animation/widgets/custom_button.dart';

class ExplicitAnimations extends StatelessWidget {
  const ExplicitAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Explicit Animation',
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
              title: 'Animated Builder',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnimatedBuilderExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Transitions Widgets',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransitionWidgetsExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Curved Animation',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CurvedAnimationExample(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Tween Sequence & Chain Animation',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TweenSequenceChainAnimation(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Interval + Staggered Animations',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const IntervalPlusStaggeredAnimations(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Reversing & Looping Animations',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReversingAndLoopingAnimations(),
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

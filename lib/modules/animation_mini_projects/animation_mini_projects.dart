import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/animated_login_screen/animated_login_screen.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/animated_progressbar/animated_progressbar.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/custom_loading_spinner/custom_loading_spinner.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/onboarding_screen/onboarding_screen.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/tinder_like_swipe_card/tinder_like_swipe_card.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';
import 'package:mastering_flutter_animation/widgets/custom_button.dart';

class AnimationMiniProjects extends StatelessWidget {
  const AnimationMiniProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Animations Mini Projects',
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
              title: 'Animated Login Screen',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnimatedLoginScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Custom Loading Spinner',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomLoadingSpinner(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Tinder Like Swipe Card',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TinderLikeSwipeCard(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Onboarding Screen',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardingScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomButton(
              title: 'Animated Progress Bar',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnimatedProgressbar(),
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

import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/animated_search_ui/animated_search_ui.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/shake_effect_on_invalid_input/shake_effect_on_invalid_input.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/animated_login_screen/animated_login_screen.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/animated_progressbar/animated_progressbar.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/animated_tabbar/animated_tabbar.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/custom_loading_spinner/custom_loading_spinner.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/expanding_cards/expanding_cards.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/hero_page_transition/hero_page_transition.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/onboarding_screen/onboarding_screen.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/ripple_effect/ripple_effect.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/lottie_animation/lottie_animation.dart';
import 'package:mastering_flutter_animation/modules/animation_mini_projects/staggered_grid_animation/staggered_grid_animation.dart';
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
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButton(
                title: 'Staggered Grid Animation',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StaggeredGridAnimation(),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButton(
                title: 'Animated Tab Bar',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimatedTabbar(),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButton(
                title: 'Hero Page Transition',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HeroPageTransition(),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButton(
                title: 'Expanding Cards',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExpandingCards(),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButton(
                title: 'Ripple Effect',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RippleEffect(),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButton(
                title: 'Lottie Animation with Controller',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LottieAnimationWithController(),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButton(
                title: 'Shake Effect on Invalid Input',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShakeEffectOnInvalidInput(),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButton(
                title: 'Animated Search UI',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimatedSearchUi(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

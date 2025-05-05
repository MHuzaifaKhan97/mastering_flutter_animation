// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/modules/advanced_animations/advanced_animations.dart';
import 'package:mastering_flutter_animation/modules/animation_libraries/animation_libraries.dart';
import 'package:mastering_flutter_animation/modules/explicit_animations/explicit_animations.dart';
import 'package:mastering_flutter_animation/modules/implicit_animations/implicit_animations.dart';

import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';
import 'package:mastering_flutter_animation/widgets/home_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Mastering Flutter Animation',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              HomeItemsWidget(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ImplicitAnimations()));
                },
                title: 'Implicit Animations',
              ),
              HomeItemsWidget(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ExplicitAnimations()));
                },
                title: 'Explicit Animations',
              ),
              HomeItemsWidget(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => AdvancedAnimations()));
                },
                title: 'Advanced Animations',
              ),
              HomeItemsWidget(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => AnimationLibraries()));
                },
                title: 'Animations Libraries',
              ),
              HomeItemsWidget(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Container()));
                },
                title: 'Animation Mini Projects',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class HeroAnimationExample extends StatefulWidget {
  const HeroAnimationExample({super.key});

  @override
  State<HeroAnimationExample> createState() => _HeroAnimationExampleState();
}

class _HeroAnimationExampleState extends State<HeroAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Hero Animation',
        isBack: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SecondPage()));
          },
          child: Hero(
            tag: 'hero-image',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://picsum.photos/200',
                width: 150,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Second Page',
        isBack: true,
      ),
      body: Center(
        child: Hero(
          tag: 'hero-image',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              'https://picsum.photos/200',
              width: 500,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}

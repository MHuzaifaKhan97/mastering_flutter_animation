import 'package:flutter/material.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Set animation duration
    );

    // Define the scale animation (20x)
    _scaleAnimation = Tween<double>(begin: 1.0, end: 70.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation when the screen is displayed
    _controller.forward().then((val) => Navigator.of(context).pop());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      // appBar: CustomRoundedAppBar(
      //   title: 'Animated Splash Screen',
      //   isBack: true,
      // ),
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          // child: FlutterLogo(size: 100), // You can replace with any widget
          child: Image.asset("assets/images/logo.png", width: 100, height: 100),
        ),
      ),
    );
  }
}

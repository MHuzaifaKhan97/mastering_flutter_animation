import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class CurvedAnimationExample extends StatefulWidget {
  const CurvedAnimationExample({super.key});

  @override
  State<CurvedAnimationExample> createState() => _CurvedAnimationExampleState();
}

class _CurvedAnimationExampleState extends State<CurvedAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _curvedAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    );

    _controller.forward();
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
      appBar: CustomRoundedAppBar(
        title: 'Curved Animation',
        isBack: true,
      ),
      body: Center(
        child: ScaleTransition(
          scale: _curvedAnimation,
          child: FlutterLogo(size: 100),
        ),
      ),
    );
  }
}

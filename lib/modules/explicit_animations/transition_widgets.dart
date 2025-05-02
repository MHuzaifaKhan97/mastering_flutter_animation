import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class TransitionWidgetsExample extends StatefulWidget {
  const TransitionWidgetsExample({super.key});

  @override
  State<TransitionWidgetsExample> createState() =>
      _TransitionWidgetsExampleState();
}

class _TransitionWidgetsExampleState extends State<TransitionWidgetsExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _slide = Tween<Offset>(
      begin: Offset(1, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

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
        title: 'Animated Builder',
        isBack: true,
      ),
      body: Center(
        child: SlideTransition(
          position: _slide,
          child: FadeTransition(
            opacity: _controller,
            child: FlutterLogo(size: 100),
          ),
        ),
      ),
    );
  }
}

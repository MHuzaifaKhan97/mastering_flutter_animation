import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class ExpandingCards extends StatefulWidget {
  const ExpandingCards({super.key});

  @override
  State<ExpandingCards> createState() => _ExpandingCardsState();
}

class _ExpandingCardsState extends State<ExpandingCards> {
  bool isExpanded = false;

  void toggleCard() {
    setState(() => isExpanded = !isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Animated Tab Bar',
        isBack: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: toggleCard,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(16),
            width: 300,
            height: isExpanded ? 250 : 140,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Tap to Expand",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 8),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: isExpanded ? 1.0 : 0.0,
                  child: isExpanded
                      ? const Text(
                          "Here is some more information about this card that you can now read after expanding it.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

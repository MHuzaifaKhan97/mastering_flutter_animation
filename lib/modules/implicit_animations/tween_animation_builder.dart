import 'package:flutter/material.dart';

// class TweenAnimationBuilderExample extends StatefulWidget {
//   const TweenAnimationBuilderExample({super.key});

//   @override
//   State<TweenAnimationBuilderExample> createState() =>
//       _TweenAnimationBuilderExampleState();
// }

// class _TweenAnimationBuilderExampleState
//     extends State<TweenAnimationBuilderExample> {
//   bool _large = false;

//   void _toggle() {
//     setState(() {
//       _large = !_large;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TweenAnimationBuilder'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onTap: _toggle,
//           child: TweenAnimationBuilder<double>(
//             tween: Tween<double>(
//               begin: 100,
//               end: _large ? 200 : 100,
//             ),
//             duration: Duration(milliseconds: 700),
//             curve: Curves.easeInOut,
//             builder: (context, size, child) {
//               return Container(
//                 width: size,
//                 height: size,
//                 color: _large ? Colors.teal : Colors.deepOrange,
//                 alignment: Alignment.center,
//                 child: Text('Tap Me',
//                     style: TextStyle(color: Colors.white, fontSize: 16)),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class TweenAnimationBuilderExample extends StatefulWidget {
  const TweenAnimationBuilderExample({super.key});

  @override
  State<TweenAnimationBuilderExample> createState() =>
      _TweenAnimationBuilderExampleState();
}

class _TweenAnimationBuilderExampleState
    extends State<TweenAnimationBuilderExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<Alignment> _alignmentAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _sizeAnimation = Tween<double>(begin: 100, end: 200).animate(_controller);
    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);
    _alignmentAnimation =
        AlignmentTween(begin: Alignment.topLeft, end: Alignment.bottomRight)
            .animate(_controller);
    _rotationAnimation =
        Tween<double>(begin: 0, end: 3.14).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TweenAnimationBuilder'),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            color: _colorAnimation.value,
            child: Align(
              alignment: _alignmentAnimation.value,
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: Container(
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  color: Colors.white,
                  child: const Center(child: Text("Animated Box")),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class StaggeredGridAnimation extends StatefulWidget {
  final double size;
  const StaggeredGridAnimation({super.key, this.size = 120});

  @override
  State<StaggeredGridAnimation> createState() => _StaggeredGridAnimationState();
}

class _StaggeredGridAnimationState extends State<StaggeredGridAnimation> {
  final List<bool> _visibleList = List.generate(12, (_) => false);

  @override
  void initState() {
    super.initState();
    _runStaggeredAnimation();
  }

  void _runStaggeredAnimation() async {
    for (int i = 0; i < _visibleList.length; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        _visibleList[i] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Staggered Grid Animation',
        isBack: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _visibleList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            opacity: _visibleList[index] ? 1.0 : 0.0,
            child: AnimatedScale(
              duration: Duration(milliseconds: 400),
              scale: _visibleList[index] ? 1.0 : 0.8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal[400],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

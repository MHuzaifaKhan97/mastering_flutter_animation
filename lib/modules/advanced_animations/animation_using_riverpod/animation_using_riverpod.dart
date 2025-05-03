import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastering_flutter_animation/modules/advanced_animations/animation_using_riverpod/animation_state.dart';

class AnimationUsingRiverpod extends ConsumerWidget {
  const AnimationUsingRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(isExpandedProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Riverpod + Animation')),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: isExpanded ? 200 : 100,
          height: isExpanded ? 200 : 100,
          decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(isExpanded ? 100 : 0)),
          curve: Curves.easeInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(isExpandedProvider.notifier).state = !isExpanded,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

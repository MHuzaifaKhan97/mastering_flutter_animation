import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class HeroPageTransition extends StatefulWidget {
  const HeroPageTransition({super.key});

  @override
  State<HeroPageTransition> createState() => _HeroPageTransitionState();
}

class _HeroPageTransitionState extends State<HeroPageTransition> {
  final List<String> images = List.generate(
    5,
    (index) => 'https://picsum.photos/id/${index + 100}/200/300',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Hero Page Transition',
        isBack: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final img = images[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HeroDetailPage(imageUrl: img),
                ),
              );
            },
            child: Hero(
              tag: img,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(img, fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  final String imageUrl;

  const HeroDetailPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: imageUrl,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.black54,
              onPressed: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

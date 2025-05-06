import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class OnboardingScreen extends StatefulWidget {
  final double size;
  const OnboardingScreen({super.key, this.size = 120});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> titles = [
    "Welcome",
    "Track Progress",
    "Achieve Goals",
  ];

  final List<String> descriptions = [
    "Welcome to our app. Let's get started!",
    "Monitor your tasks and stay organized.",
    "Complete challenges and level up!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Animated Onboarding',
        isBack: true,
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemCount: titles.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(fontSize: 48, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: _currentPage == index ? 1 : 0,
                      child: Text(
                        titles[index],
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: _currentPage == index ? 1 : 0,
                      child: Text(
                        descriptions[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(titles.length, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      width: _currentPage == index ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.blueAccent
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < titles.length - 1) {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Done, navigate to app
                    }
                  },
                  child:
                      Text(_currentPage == titles.length - 1 ? 'Done' : 'Next'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

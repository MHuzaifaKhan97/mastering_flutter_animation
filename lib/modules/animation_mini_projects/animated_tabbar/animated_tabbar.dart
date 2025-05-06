import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class AnimatedTabbar extends StatefulWidget {
  const AnimatedTabbar({super.key});

  @override
  State<AnimatedTabbar> createState() => _AnimatedTabbarState();
}

class _AnimatedTabbarState extends State<AnimatedTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  final List<String> _tabs = ["Home", "Search", "Profile"];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _getAlignX(int index) {
    return (index / (_tabs.length - 1)) * 2 - 1; // from -1 to 1
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Animated Tab Bar',
        isBack: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Container(
            height: 48,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment: Alignment(_getAlignX(_controller.index), 0),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Container(
                    width:
                        MediaQuery.of(context).size.width / _tabs.length - 24,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TabBar(
                  controller: _controller,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black87,
                  onTap: (_) => setState(() {}),
                  tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: _tabs.map((tab) {
                return Center(
                    child: Text(
                  "$tab Content",
                  style: TextStyle(fontSize: 24),
                ));
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

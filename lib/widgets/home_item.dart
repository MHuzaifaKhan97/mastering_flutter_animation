import 'package:flutter/material.dart';

class HomeItemsWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const HomeItemsWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF9D4EDD), // Bold Neon Lavender
                Color(0xFF00BBF9), // Electric Cyan Pop
              ],
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              // color: Color.fromARGB(255, 55, 50, 50),
              shadows: [
                Shadow(
                  offset: Offset(0, 2),
                  blurRadius: 10.0,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

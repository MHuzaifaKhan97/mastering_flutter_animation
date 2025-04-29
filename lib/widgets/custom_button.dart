import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const CustomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF9D4EDD), // Bold Neon Lavender
              Color(0xFF00BBF9), // Electric Cyan Pop
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

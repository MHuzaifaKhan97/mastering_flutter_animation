import 'package:flutter/material.dart';

class CustomRoundedAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final double height;
  final Color backgroundColor;
  final TextStyle? titleStyle;
  final bool isBack;

  const CustomRoundedAppBar({
    super.key,
    required this.title,
    this.height = 120.0,
    this.isBack = false,
    this.backgroundColor = Colors.white,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [
        //     Color(0xFF240046), // Deep Space Purple (base)
        //     Color(0xFF5A189A), // Royal Violet
        //     Color(0xFF9D4EDD), // Bold Neon Lavender
        //     // Color(0xFF3C096C), // Dark Purple Punch
        //     Color(0xFF00BBF9), // Electric Cyan Pop
        //   ],
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: isBack ? 10 : 20, top: 10),
      child: Row(
        mainAxisAlignment:
            isBack ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          isBack
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: () => Navigator.pop(context),
                )
              : const SizedBox.shrink(),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [
                  Color(0xFF240046), // Deep Space Purple (base)
                  Color(0xFF5A189A), // Royal Violet
                  Color(0xFF9D4EDD), // Bold Neon Lavender
                  Color(0xFF3C096C), // Dark Purple Punch
                  Color(0xFF00BBF9), // Electric Cyan Pop
                ], // Gradient colors
                begin: Alignment.topLeft, // Gradient starts from top-left
                end: Alignment.bottomRight, // Gradient ends at bottom-right
              ).createShader(bounds);
            },
            child: Text(
              title,
              style: titleStyle ??
                  const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    // shadows: [
                    //   Shadow(
                    //     offset: Offset(0, 2),
                    //     blurRadius: 8.0,
                    //     color: Colors.white,
                    //   ),
                    // ],
                  ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

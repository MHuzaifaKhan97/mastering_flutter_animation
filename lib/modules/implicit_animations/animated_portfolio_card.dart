import 'package:flutter/material.dart';

class AnimatedProfileCard extends StatefulWidget {
  const AnimatedProfileCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedProfileCardState createState() => _AnimatedProfileCardState();
}

class _AnimatedProfileCardState extends State<AnimatedProfileCard> {
  bool _expanded = false;
  bool _showAvatar1 = true;
  int _likes = 0;

  void _toggleCard() {
    setState(() {
      _expanded = !_expanded;
      _showAvatar1 = !_showAvatar1;
    });
  }

  void _toggleAvatar() {
    setState(() {
      _showAvatar1 = !_showAvatar1;
    });
  }

  void _incrementLikes() {
    setState(() {
      _likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Portfolio Card'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: GestureDetector(
          onTap: _toggleCard,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 600),
            width: _expanded ? 300 : 220,
            height: _expanded ? 320 : 200,
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _expanded ? Colors.white : Colors.indigo,
              borderRadius: BorderRadius.circular(_expanded ? 24 : 12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar with crossfade
                GestureDetector(
                  onTap: _toggleAvatar,
                  child: AnimatedCrossFade(
                    duration: Duration(milliseconds: 400),
                    firstChild: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://lh3.googleusercontent.com/a/AGNmyxbwB0anUZswjsdXcnwHGZoLLxSvBmLQlnc0A4bBFw=s96-c'),
                    ),
                    secondChild: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://media.licdn.com/dms/image/v2/D4D03AQEt-CrwtiSdIQ/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1690032860181?e=1751500800&v=beta&t=OCo7A5Vf0yp6y4I1PpVsvdFxjBh3uiAxNPaVq_9sOcE'),
                    ),
                    crossFadeState: _showAvatar1
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'M Huzaifa Khan',
                  style: TextStyle(
                    fontSize: 18,
                    color: _expanded ? Colors.black87 : Colors.white,
                  ),
                ),

                // AnimatedSwitcher for likes
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Text(
                    'Likes: $_likes',
                    key: ValueKey(_likes),
                    style: TextStyle(
                      fontSize: 16,
                      color: _expanded ? Colors.grey[700] : Colors.white70,
                    ),
                  ),
                ),

                SizedBox(height: 8),

                // More info on expand (fade in)
                AnimatedOpacity(
                  opacity: _expanded ? 1 : 0,
                  duration: Duration(milliseconds: 600),
                  child: Visibility(
                    visible: _expanded,
                    child: Column(
                      children: [
                        Text(
                          'Flutter Developer • 4+ yrs exp',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                          'Karachi, Pakistan',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: _incrementLikes,
                          icon: Icon(Icons.thumb_up),
                          label: Text("Like"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

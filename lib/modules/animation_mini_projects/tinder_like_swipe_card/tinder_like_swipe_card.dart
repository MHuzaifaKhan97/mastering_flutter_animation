import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class TinderLikeSwipeCard extends StatefulWidget {
  final double size;
  const TinderLikeSwipeCard({super.key, this.size = 120});

  @override
  State<TinderLikeSwipeCard> createState() => _TinderLikeSwipeCardState();
}

class _TinderLikeSwipeCardState extends State<TinderLikeSwipeCard>
    with SingleTickerProviderStateMixin {
  List<CardItem> cards = [
    CardItem('A', Colors.red),
    CardItem('B', Colors.green),
    CardItem('C', Colors.blue),
    CardItem('D', Colors.yellow),
    CardItem('E', Colors.purple)
  ];
  Offset _position = Offset.zero;
  double _rotation = 0;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _position += details.delta;
      _rotation = _position.dx / 300;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_position.dx > 150) {
      // Swiped right
      _removeTopCard();
    } else if (_position.dx < -150) {
      // Swiped left
      _removeTopCard();
    } else {
      // Reset
      setState(() {
        _position = Offset.zero;
        _rotation = 0;
      });
    }
  }

  void _removeTopCard() {
    setState(() {
      cards.removeLast();
      _position = Offset.zero;
      _rotation = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Tinder Like Swipe Card',
        isBack: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: cards.asMap().entries.map((entry) {
            int index = entry.key;
            // String label = entry.value.label;

            bool isTopCard = index == cards.length - 1;

            return Positioned(
              top: 20 + (cards.length - index - 1) * 10,
              child: isTopCard
                  ? GestureDetector(
                      onPanUpdate: _onPanUpdate,
                      onPanEnd: _onPanEnd,
                      child: Transform.translate(
                        offset: _position,
                        child: Transform.rotate(
                          angle: _rotation,
                          child: SingleCardWidget(
                            cardItem: cards[index],
                          ),
                        ),
                      ),
                    )
                  : SingleCardWidget(cardItem: cards[index]),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SingleCardWidget extends StatelessWidget {
  final CardItem cardItem;
  const SingleCardWidget({super.key, required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 350,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: cardItem.color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      child: Center(
        child: Text(cardItem.label,
            style: TextStyle(fontSize: 48, color: Colors.white)),
      ),
    );
  }
}

class CardItem {
  final String label;
  final Color color;
  CardItem(this.label, this.color);
}

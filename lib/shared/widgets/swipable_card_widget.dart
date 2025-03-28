import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeableCardWidget extends StatefulWidget {
  const SwipeableCardWidget({super.key});

  @override
  State<SwipeableCardWidget> createState() => _SwipeableCardWidgetState();
}

class _SwipeableCardWidgetState extends State<SwipeableCardWidget> {
  final List<Widget> cards = const [
    InsightCard(
      imagePath: 'assets/heart_rate.png',
      text:
          'Your resting heart rate is 75 bpm, a healthy range indicating good cardiovascular health.',
    ),
    InsightCard(
      imagePath: 'assets/sleep.png',
      text:
          'You slept for 8 hours last night, keeping you refreshed and energized.',
    ),
    InsightCard(
      imagePath: 'assets/steps.png',
      text: 'You walked 10,000 steps today — great job hitting your goal!',
    ),
  ];

  int currentIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 180,
          child: CardSwiper(
            cardsCount: cards.length,
            numberOfCardsDisplayed: 3,
            cardBuilder: (
              context,
              index,
              percentThresholdX,
              percentThresholdY,
            ) {
              return cards[index];
            },
            backCardOffset: const Offset(0, 20),
            onSwipe: (previousIndex, targetIndex, direction) {
              setState(() {
                currentIndex = targetIndex!;
              });
              return true;
            },
          ),
        ),

        const SizedBox(height: 12),

        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
              ),
              width: MediaQuery.of(context).size.width * 0.2,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                children: List.generate(cards.length, (index) {
                  double segmentWidth =
                      (MediaQuery.of(context).size.width * 0.2) / cards.length;

                  return Container(
                    width: segmentWidth,
                    height: 4,
                    decoration: BoxDecoration(
                      color:
                          index == currentIndex
                              ? const Color(0xFF707070)
                              : Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class InsightCard extends StatelessWidget {
  final String imagePath;
  final String text;

  const InsightCard({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: const Color(0xFFF5F5F5),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 14,
                  fontFamily: 'Rubik',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

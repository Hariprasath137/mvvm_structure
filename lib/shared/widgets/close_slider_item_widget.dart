import 'package:flutter/material.dart';

class HorizontalCardWidget extends StatefulWidget {
  const HorizontalCardWidget({super.key});

  @override
  State<HorizontalCardWidget> createState() => _HorizontalCardWidgetState();
}

class _HorizontalCardWidgetState extends State<HorizontalCardWidget> {
  final List<Widget> cards = const [
    InsightCard(
      imagePath: 'assets/Rectangle.png',
      text:
          'Your resting heart rate is 75 bpm, a healthy range indicating good cardiovascular health.',
    ),
    InsightCard(
      imagePath: 'assets/Rectangle.png',
      text:
          'You slept for 8 hours last night, keeping you refreshed and energized.',
    ),
    InsightCard(
      imagePath: 'assets/Rectangle.png',
      text: 'You walked 10,000 steps today — great job hitting your goal!',
    ),
  ];

  double pageOffset = 0.0;
  final PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        pageOffset = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: screenWidth * 0.9,
          height: screenHeight * 0.18, // Responsive height
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            physics: const PageScrollPhysics(),
            itemBuilder: (context, index) {
              return cards[index];
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: screenWidth * 0.08),
              width: screenWidth * 0.2,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                children: List.generate(cards.length, (index) {
                  double segmentWidth = (screenWidth * 0.2) / cards.length;
                  return Container(
                    width: segmentWidth,
                    height: 6,
                    decoration: BoxDecoration(
                      color:
                          index == pageOffset.round()
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
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: const Color(0xFFF5F5F5),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.15,
              height: screenWidth * 0.15, // Adjust based on screen width
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: const Color(0xFF707070),
                        fontSize: screenWidth * 0.035, // Responsive text size
                        fontFamily: 'Rubik',
                      ),
                      maxLines: 3, // Limit lines to avoid overflow
                      overflow: TextOverflow.ellipsis, // Add "..." if too long
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Talk to tvamev',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF121417),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

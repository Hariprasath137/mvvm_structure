import 'package:flutter/material.dart';

class DailySummaryWidget extends StatefulWidget {
  const DailySummaryWidget({super.key});

  @override
  State<DailySummaryWidget> createState() => _DailySummaryWidgetState();
}

class _DailySummaryWidgetState extends State<DailySummaryWidget> {
  final List<Widget> cards = const [
    InsightCard(
      imagePath: 'assets/imgSample.png',
      text: 'Average HR is 75 bpm. Curious about this meaning?',
    ),
    InsightCard(
      imagePath: 'assets/imgSample.png',
      text: 'Average HR is 75 bpm. Curious about this meaning?',
    ),
  ];

  double pageOffset = 0.0;
  final PageController _pageController = PageController();

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
    // Get screen dimensions
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: screenWidth * 0.90, // Reduced width
            height: screenHeight * 0.15, // Responsive height
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
          SizedBox(height: screenHeight * 0.01), // Responsive spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the row
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: screenWidth * 0.04, // Reduced margin
                ),
                width: screenWidth * 0.7, // Reduced width
                height: screenHeight * 0.01, // Responsive height
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  children: List.generate(cards.length, (index) {
                    double segmentWidth =
                        (screenWidth * 0.7) / cards.length; // Responsive width
                    return Container(
                      width: segmentWidth,
                      height: screenHeight * 0.01, // Responsive height
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
      ),
    );
  }
}

class InsightCard extends StatelessWidget {
  final String imagePath;
  final String text;

  const InsightCard({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          screenWidth * 0.05,
        ), // Responsive radius
      ),
      color: const Color(0xFFF5F5F5),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03), // Reduced padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.15, // Further reduced width
              height: screenHeight * 0.08, // Further reduced height
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(
                  screenWidth * 0.03,
                ), // Responsive radius
              ),
            ),
            SizedBox(width: screenWidth * 0.03), // Reduced spacing
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: const Color(0xFF707070),
                      fontSize: screenWidth * 0.03, // Reduced font size
                      fontFamily: 'Rubik',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01), // Responsive spacing
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Talk to tvamev',
                      style: TextStyle(
                        fontSize: screenWidth * 0.03, // Reduced font size
                        fontWeight: FontWeight.bold,
                        color: const Color(0XFF121417),
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

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
      text: 'Average HR is 75 bpm.Curious about this meaning?',
    ),
    InsightCard(
      imagePath: 'assets/imgSample.png',
      text: 'Average HR is 75 bpm.Curious about this meaning?',
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 130,
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
              width: 50,
              height: 50,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 14,
                      fontFamily: 'Rubik',
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

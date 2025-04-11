import 'package:flutter/material.dart';

class V02CurosalWidget extends StatefulWidget {
  const V02CurosalWidget({super.key});

  @override
  State<V02CurosalWidget> createState() => _V02CurosalWidgetState();
}

class _V02CurosalWidgetState extends State<V02CurosalWidget> {
  final List<Widget> cards = const [
    InsightCard(
      imagePath: 'assets/imgSample.png',
      text: 'Great job! Your VO2 Max improved by 5% this month.',
    ),
    InsightCard(
      imagePath: 'assets/imgSample.png',
      text: 'Average HR is 75 bpm. Curious about this meaning?',
    ),
  ];

  double pageOffset = 0.0;
  final PageController _pageController = PageController(
    viewportFraction: 0.85,
  ); 

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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 138, 
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            physics: const PageScrollPhysics(),
            itemBuilder: (context, index) {
              
              return Transform.scale(
                scale: 1 - (pageOffset - index).abs() * 0.1, 
                child: Opacity(
                  opacity: 1 - (pageOffset - index).abs() * 0.3, 
                  child: SizedBox(
                    width:
                        MediaQuery.of(context).size.width *
                        0.85, 
                    child: cards[index],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
              ),
              width: MediaQuery.of(context).size.width * 0.2,
              height: 6,
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
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: const Color(0xFFD9D9D9),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Container(
                width: screenWidth * 0.12,
                height: screenWidth * 0.12,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),

              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   
                    Text(
                      text,
                      style: TextStyle(
                        color: const Color(0xFF707070),
                        fontSize: screenWidth * 0.035,
                        fontFamily: 'Rubik',
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(
                      height: 8,
                    ), 
                   
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(screenWidth * 0.2, 24),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Talk to tvamev',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                            color: const Color(0XFF121417),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

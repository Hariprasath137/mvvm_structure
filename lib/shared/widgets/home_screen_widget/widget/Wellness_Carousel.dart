import 'package:flutter/material.dart';

class WellnessCarousel extends StatefulWidget {
  final List<String> titles;

  // Constructor to accept a list of titles
  WellnessCarousel({required this.titles});

  @override
  _WellnessCarouselState createState() => _WellnessCarouselState();
}

class _WellnessCarouselState extends State<WellnessCarousel> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  void _showGratitudeNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Clicked from Wellness Widget Card ;)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingFactor = screenWidth * 0.04;

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              double containerWidth = constraints.maxWidth;

              return Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(paddingFactor),
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemCount: widget.titles.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: containerWidth * 0.2,
                          margin: EdgeInsets.only(right: paddingFactor * 0.5),
                          child: Center(
                            child: Text(
                              "Wellness Score",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(paddingFactor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.titles[index],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: paddingFactor),
                                  InkWell(
                                    onTap: _showGratitudeNotification,
                                    child: Text(
                                      "Talk to tvamev",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),

          SizedBox(height: paddingFactor),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey,
                ),
                child: Stack(
                  children: List.generate(widget.titles.length, (index) {
                    double widthPerDot = 20;
                    double offset = _currentPage == index ? index * widthPerDot.toDouble() : 0.0;

                    return Positioned(
                      left: offset,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: widthPerDot,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _currentPage == index ? Colors.blueGrey : Colors.transparent,
                        ),
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

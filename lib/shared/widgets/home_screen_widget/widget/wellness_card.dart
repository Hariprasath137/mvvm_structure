
import 'package:flutter/material.dart';

class WellnessCarousel extends StatefulWidget {
  const WellnessCarousel({super.key});

  @override
  _WellnessCarouselState createState() => _WellnessCarouselState();
}

class _WellnessCarouselState extends State<WellnessCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> data = [
    {
      'title': 'Your step count is 20% higher than last week! Keep going.',
    },
    {
      'title': 'You slept 2 hours more last night, great progress!',
    },
    {
      'title': 'Your hydration is on track today, keep it up!',
    },
  ];


  void _showGratitudeNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Clicked from Wellness Widget Card ;)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            
            Container(
              height: 120,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: 80,
                        margin: EdgeInsets.only(right: 8),
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
                      
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: 270,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data[index]['title']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
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
                    ],
                  );
                },
              ),
            ),


            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 60,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey,
                ),
                child: Stack(
                  children: List.generate(3, (index) {
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
            ),
          ],
        ),
      ),
    );
  }
}

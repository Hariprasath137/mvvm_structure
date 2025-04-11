import 'package:flutter/material.dart';

class WellnessCarousel extends StatefulWidget {
  @override
  _WellnessCarouselState createState() => _WellnessCarouselState();
}

class _WellnessCarouselState extends State<WellnessCarousel> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  // List of dynamic data for each page
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

  // Method to show the notification when the 'Talk to tvamev' is clicked
  void _showGratitudeNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Clicked from Wellness Widget Card ;)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size and calculate padding dynamically based on width
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingFactor = screenWidth * 0.04; // 4% of screen width for padding

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          // Using LayoutBuilder to make it dependent on the outer container's size
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
                padding: EdgeInsets.all(paddingFactor), // Dynamic padding
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
                        // Adjusting width based on the outer container (LayoutBuilder)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: containerWidth * 0.2, // 20% of the outer container's width
                          margin: EdgeInsets.only(right: paddingFactor * 0.5), // Dynamic margin
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
                        // The remaining space will be occupied by the next container
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(paddingFactor), // Dynamic padding
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Main text from the data list
                                  Text(
                                    data[index]['title']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: paddingFactor), // Dynamic space
                                  // Constant "Talk to tvamev" with InkWell
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

          // Adding the carousel indicator directly below the second inner container
          SizedBox(height: paddingFactor), // Dynamic spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60, // Adjust this to match the total width of all the dots
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey, // Background color for inactive dots
                ),
                child: Stack(
                  children: List.generate(3, (index) {
                    double widthPerDot = 20; // Width of each individual dot

                    // The offset that shifts the active dot to the correct position
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

import 'package:flutter/material.dart';

class FactorsHeartRate extends StatefulWidget {
  const FactorsHeartRate({super.key});

  @override
  State<FactorsHeartRate> createState() => _FactorsHeartRateState();
}

class _FactorsHeartRateState extends State<FactorsHeartRate> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Map<String, String>> factors = [
    {
      "title": "Sleep Quality",
      "description":
          "Poor sleep patterns can elevate resting heart rate over time.",
      "image": "assets/factors.png",
    },
    {
      "title": "Stress Levels",
      "description":
          "High stress can cause an increase in heart rate and blood pressure.",
      "image": "assets/factors.png",
    },
    {
      "title": "Physical Activity",
      "description":
          "Regular exercise helps maintain a healthy resting heart rate.",
      "image": "assets/factors.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate adaptive height based on screen size
    double cardHeight = screenHeight * 0.28;
    double pageViewHeight = cardHeight + 16; // Adding minimal padding

    return SizedBox(
      height: pageViewHeight,
      child: PageView.builder(
        controller: _pageController,
        itemCount: factors.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final factor = factors[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Card(
              color: const Color(0XFFF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                height: cardHeight,
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Factors Affecting Heart Rate",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text section
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  factor["title"]!,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  factor["description"]!,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(0, 36),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("View Details"),
                                      SizedBox(width: 4),
                                      Icon(Icons.arrow_forward),
                                    ],
                                  ),
                                ),
                                // Small progress bar inside the card
                                SizedBox(
                                  width: screenWidth * 0.2,
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      // Background track
                                      Container(
                                        height: screenHeight * 0.006,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                      ),
                                      // Moving indicator
                                      AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        width: screenWidth * 0.08,
                                        height: screenHeight * 0.006,
                                        decoration: BoxDecoration(
                                          color: Colors.black87,
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(
                                          left:
                                              (_currentIndex /
                                                  (factors.length - 1)) *
                                              (screenWidth * 0.12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Image
                          Flexible(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                factor["image"]!,
                                height: screenHeight * 0.12,
                                width: screenHeight * 0.12,
                                fit: BoxFit.cover,
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
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Achievements_Widget extends StatelessWidget {
  final List<String> activities; // List of activities
  final List<String> days; // List of days

  // Constructor to accept dynamic data
  Achievements_Widget({
    required this.activities,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth = screenWidth * 0.35;
    double containerHeight = screenHeight * 0.13;

    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,  // Ensures it takes up minimal height
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Recent Achievements',
          //       style: TextStyle(
          //         fontFamily: 'Poppins',
          //         fontWeight: FontWeight.bold,
          //         fontSize: screenHeight * 0.025,
          //         color: Colors.black,
          //       ),
          //     ),
          //     TextButton(
          //       onPressed: () {},
          //       child: Row(
          //         children: [
          //           Text(
          //             'View All ',
          //             style: TextStyle(
          //               fontFamily: 'Poppins',
          //               fontWeight: FontWeight.normal,
          //               fontSize: screenHeight * 0.02,
          //               color: Colors.black,
          //             ),
          //           ),
          //           Icon(
          //             Icons.arrow_forward,
          //             size: screenHeight * 0.02,
          //             color: const Color(0xff4b5563),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(height: screenHeight * 0.01),
          Container(
            height: containerHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: activities.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  child: Container(
                    width: containerWidth,
                    height: containerHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: const Color(0x88EDEDED),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * 0.015),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.emoji_events_rounded,
                                size: containerHeight * 0.40,
                                color: const Color(0xff4b5563),
                              ),
                              SizedBox(height: containerHeight * 0.01),
                              Text(
                                activities[index],
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: containerHeight * 0.15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: containerHeight * 0.01),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: containerHeight * 0.10,
                                    color: const Color(0xff4b5563),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: days[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

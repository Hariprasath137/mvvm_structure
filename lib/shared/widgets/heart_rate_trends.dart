import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/heart_rate/view/heart_rate_trends_full.dart';
import 'package:mvvm_structure_reference/shared/widgets/card/bpm_value_card.dart';

class HeartRateTrends extends StatefulWidget {
  const HeartRateTrends({super.key});

  @override
  State<HeartRateTrends> createState() => _HeartRateTrendsState();
}

class _HeartRateTrendsState extends State<HeartRateTrends> {
  
  final List<HeartRateEntry> heartRateEntries = [
    HeartRateEntry(
      bpm: "76",
      status: "Normal",
      activity: "Exercise",
      timestamp: "11th Dec 2024, 10:54 AM",
    ),
    HeartRateEntry(
      bpm: "98",
      status: "Normal",
      activity: "Running",
      timestamp: "11th Dec 2024, 10:54 AM",
    ),
    HeartRateEntry(
      bpm: "102",
      status: "Normal",
      activity: "Standing",
      timestamp: "11th Dec 2024, 10:54 AM",
    ),
    HeartRateEntry(
      bpm: "76",
      status: "Normal",
      activity: "Exercise",
      timestamp: "11th Dec 2024, 10:54 AM",
    ),
    HeartRateEntry(
      bpm: "98",
      status: "Normal",
      activity: "Running",
      timestamp: "11th Dec 2024, 10:54 AM",
    ),
    HeartRateEntry(
      bpm: "102",
      status: "Normal",
      activity: "Standing",
      timestamp: "11th Dec 2024, 10:54 AM",
    ),
    HeartRateEntry(
      bpm: "76",
      status: "Normal",
      activity: "Exercise",
      timestamp: "11th Dec 2024, 10:54 AM",
    ),
    HeartRateEntry(
      bpm: "98",
      status: "Normal",
      activity: "Running",
      timestamp: "11th Dec 2024, 10:54 AM",
    ),
    HeartRateEntry(
      bpm: "102",
      status: "Normal",
      activity: "Standing",
      timestamp: "11th Dec 2024, 10:54 AM",
    ),
   
  ];

  void _navigateToAllHeartRateTrends() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AllHeartRateTrends(heartRateEntries: heartRateEntries),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      color: const Color(0XFFF6F8F9),
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.05,
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          bottom: screenHeight * 0.01,
        ), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "Heart Rate Trends",
                    style: TextStyle(
                      fontSize: screenWidth * 0.06, // Responsive font size
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min, // Reduce unnecessary space
                  children: [
                    InkWell(
                      onTap:
                          _navigateToAllHeartRateTrends, // Navigate to next page
                      child: Row(
                        children: [
                          Text(
                            "View all",
                            style: TextStyle(
                              color: const Color(0XFF193238),
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  screenWidth * 0.04, // Responsive font size
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: const Color(0XFF193238),
                            size: screenWidth * 0.06, // Responsive icon size
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing
            // Main Content Rows (Repeating Pattern)
            ...List.generate(2, (index) {
              return Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align children to the top
                children: [
                  // BPM Widget on the Left
                  BPMValue(bpm: "76"), // No extra padding or constraints
                  SizedBox(width: screenWidth * 0.02), // Responsive spacing
                  // Column for CardButton, Text, and Date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .center, // Align children vertically
                          children: [
                            Chip(
                              label: Text(
                                "Normal",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Color(
                                0XFFA9AAAA,
                              ), // Customize color based on status
                            ),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ), // Responsive spacing
                            Flexible(
                              child: Text(
                                "Exercise",
                                style: TextStyle(
                                  color: const Color(0XFF193238),
                                  fontSize:
                                      screenWidth *
                                      0.04, // Responsive font size
                                ),
                                overflow:
                                    TextOverflow.ellipsis, // Prevent overflow
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ), // Responsive spacing
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.02),
                          child: Text(
                            "11th Dec 2024, 10:54 AM",
                            style: TextStyle(
                              color: const Color(0XFF193238),
                              fontSize:
                                  screenWidth * 0.035, // Responsive font size
                            ),
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey[300]),
                      ],
                    ),
                  ),

                  // IconButton at the End, Centered Vertically
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.03,
                    ), // Align vertically
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: screenWidth * 0.06, // Responsive icon size
                        color: const Color(0XFF193238),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

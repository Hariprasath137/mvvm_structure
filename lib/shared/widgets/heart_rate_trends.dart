import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/heart_rate/view/details_screen.dart';
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
        ),
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
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: _navigateToAllHeartRateTrends,
                      child: Row(
                        children: [
                          Text(
                            "View all",
                            style: TextStyle(
                              color: const Color(0XFF193238),
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: const Color(0XFF193238),
                            size: screenWidth * 0.06,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),

            ...List.generate(2, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => DetailsScreen(
                            entry: HeartRateEntry(
                              bpm: "76",
                              status: "Normal",
                              activity: "Exercise",
                              timestamp: "11th Dec 2024, 10:54 AM",
                            ),
                          ),
                    ),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BPMValue(bpm: "76"),
                    SizedBox(width: screenWidth * 0.02),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Chip(
                                label: Text(
                                  "Normal",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Color(0XFFA9AAAA),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Flexible(
                                child: Text(
                                  "Exercise",
                                  style: TextStyle(
                                    color: const Color(0XFF193238),
                                    fontSize: screenWidth * 0.04,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.02),
                            child: Text(
                              "11th Dec 2024, 10:54 AM",
                              style: TextStyle(
                                color: const Color(0XFF193238),
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ),
                          Divider(thickness: 1, color: Colors.grey[300]),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.03,
                      ), 
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => DetailsScreen(
                                    entry: HeartRateEntry(
                                      bpm: "76",
                                      status: "Normal",
                                      activity: "Exercise",
                                      timestamp: "11th Dec 2024, 10:54 AM",
                                    ),
                                  ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: screenWidth * 0.06,
                          color: const Color(0XFF193238),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

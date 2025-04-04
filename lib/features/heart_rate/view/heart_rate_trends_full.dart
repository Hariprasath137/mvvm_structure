import 'package:flutter/material.dart';
import 'details_screen.dart'; // Import the DetailsScreen

class AllHeartRateTrends extends StatelessWidget {
  final List<HeartRateEntry> heartRateEntries;

  const AllHeartRateTrends({super.key, required this.heartRateEntries});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    // Responsive font sizes
    final bpmFontSize =
        screenWidth * 0.05; // Responsive font size for BPM value
    final labelFontSize =
        screenWidth * 0.03; // Responsive font size for "bpm" label

    return Scaffold(
      appBar: AppBar(
        title: Text("All Heart Rate Trends"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading: "Heart Rate History"
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ), // Responsive padding
            child: Text(
              "Heart Rate History",
              style: TextStyle(
                fontSize: screenWidth * 0.06, // Responsive font size
                fontWeight: FontWeight.bold,
                color: Colors.black, // Customize text color
              ),
            ),
          ),
          // Expanded ListView for Scrollable Content
          Expanded(
            child: ListView.builder(
              itemCount: heartRateEntries.length,
              itemBuilder: (context, index) {
                final entry = heartRateEntries[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      // Leading Widget: Square with Rounded Corners
                      leading: SizedBox(
                        width:
                            screenWidth *
                            0.15, // Responsive width (15% of screen width)
                        height:
                            screenWidth *
                            0.15, // Responsive height (15% of screen width)
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0XFF747A7B), // Background color
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // Rounded corners
                          ),
                          alignment: Alignment.center, // Center content
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .center, // Center content vertically
                            children: [
                              // BPM Value at the Top
                              Flexible(
                                child: Text(
                                  entry.bpm,
                                  style: TextStyle(
                                    color: Color(0XFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        bpmFontSize, // Responsive font size
                                  ),
                                  overflow:
                                      TextOverflow.ellipsis, // Prevent overflow
                                  maxLines: 1, // Ensure single line
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.005,
                              ), // Responsive spacing
                              // "bpm" Text Below
                              Flexible(
                                child: Text(
                                  "bpm",
                                  style: TextStyle(
                                    color: Color(0XFFFFFFFF),
                                    fontSize:
                                        labelFontSize, // Responsive font size
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      title: LayoutBuilder(
                        builder: (context, constraints) {
                          return Row(
                            children: [
                              // Status Chip
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      constraints.maxWidth *
                                      0.3, // Limit chip width
                                ),
                                child: Chip(
                                  label: Text(
                                    entry.status,
                                    style: TextStyle(color: Colors.white),
                                    overflow:
                                        TextOverflow
                                            .ellipsis, // Prevent overflow
                                    maxLines: 1, // Ensure single line
                                  ),
                                  backgroundColor: Color(
                                    0XFFA9AAAA,
                                  ), // Customize color based on status
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.02,
                              ), // Responsive spacing
                              // Activity Text
                              Expanded(
                                child: Text(
                                  entry.activity,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  overflow:
                                      TextOverflow.ellipsis, // Prevent overflow
                                  maxLines: 1, // Ensure single line
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      subtitle: Text(
                        entry.timestamp,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                        ), // Responsive font size
                        overflow: TextOverflow.ellipsis, // Prevent overflow
                        maxLines: 1, // Ensure single line
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to the Details Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(entry: entry),
                          ),
                        );
                      },
                    ),
                    // Divider that spans from under the timestamp to the trailing icon
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Divider(
                        thickness: 1, // Thickness of the divider
                        color: Colors.grey[300], // Color of the divider
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Model for heart rate entries
class HeartRateEntry {
  final String bpm;
  final String status;
  final String activity;
  final String timestamp;

  HeartRateEntry({
    required this.bpm,
    required this.status,
    required this.activity,
    required this.timestamp,
  });
}

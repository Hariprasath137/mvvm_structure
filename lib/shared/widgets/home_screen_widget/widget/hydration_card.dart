import 'package:flutter/material.dart';

class HydrationCard extends StatelessWidget {
  final String dailyGoal;
  final String hydrationStatus;
  final String consumed;
  final String remaining;

  // Constructor to accept dynamic values
  const HydrationCard({
    Key? key,
    required this.dailyGoal,
    required this.hydrationStatus,
    required this.consumed,
    required this.remaining,
  }) : super(key: key);

  // A method to generate text style dynamically based on container height
  TextStyle _textStyle(double containerHeight, double fontSizeFactor, FontWeight fontWeight) {
    return TextStyle(
      color: Colors.black, // Font color changed to black
      fontFamily: 'Poppins',
      fontSize: containerHeight * fontSizeFactor,
      fontWeight: fontWeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth = screenWidth * 0.90;
    double containerHeight = screenHeight * 0.2;

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(245, 245, 245, 1),
        border: Border.all(
          color: Color.fromRGBO(204, 204, 204, 1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(containerWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: containerHeight * 0.08,  // Size of the dot
                  height: containerHeight * 0.08,  // Size of the dot
                  decoration: BoxDecoration(
                    color: Colors.blue,  // Dot color (change as needed)
                    shape: BoxShape.circle,  // Circular shape
                  ),
                ),
                SizedBox(width: containerWidth * 0.02),  // Space between dot and text
                Text(
                  'Hydration',
                  textAlign: TextAlign.left,
                  style: _textStyle(containerHeight, 0.12, FontWeight.bold),
                ),
                Spacer(),  // This will push the arrow to the far right
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: containerHeight * 0.12,
                ),
              ],
            ),
            SizedBox(height: containerHeight * 0.03),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Daily Goal: ",
                                textAlign: TextAlign.left,
                                style: _textStyle(containerHeight, 0.09, FontWeight.normal),
                              ),
                              Text(
                                dailyGoal,
                                textAlign: TextAlign.left,
                                style: _textStyle(containerHeight, 0.09, FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: containerHeight * 0.05),
                          Expanded(
                            child: Row(
                              children: [
                                _buildStatColumn('Hydrated by', hydrationStatus, containerHeight),
                                _buildStatColumn('Consumed', consumed, containerHeight),
                                _buildStatColumn('Remaining', remaining, containerHeight),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: containerWidth * 0.02),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white38, // Light greyish white for Water Container
                        borderRadius: BorderRadius.circular(16), // Rounded corners
                      ),
                      child: Center(
                        child: Text(
                          'Water Container',
                          textAlign: TextAlign.center, // Ensure the text is centered horizontally
                          style: TextStyle(
                            color: Colors.black26,
                            fontFamily: 'Poppins',
                            fontSize: containerHeight * 0.1,
                          ),
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
    );
  }

  // Helper method to avoid repetition in building stat columns
  Widget _buildStatColumn(String title, String value, double containerHeight) {
    return Expanded(
      flex: 3,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: containerHeight * 0.07,
                color: Colors.black54, // Ensure font color is black
              ),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: containerHeight * 0.07,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

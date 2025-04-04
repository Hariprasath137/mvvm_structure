import 'package:flutter/material.dart';

class TempeatureSpo2Card extends StatelessWidget {
  final String label;
  final int value;
  final String metric;
  final String range;

  // Constructor to accept dynamic values
  TempeatureSpo2Card({
    required this.label,
    required this.value,
    required this.metric,
    required this.range,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate dynamic container size based on screen size
    double containerWidth = screenWidth * 0.45; // 45% of screen width
    double containerHeight = screenHeight * 0.15; // 15% of screen height

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // First row: Dynamic label and icon (arrow)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label, // Dynamic label
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(89, 89, 89, 1),
                    fontFamily: 'Poppins',
                    fontSize: containerHeight * 0.12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: containerHeight * 0.12, // Adjust size
                ),
              ],
            ),
            SizedBox(height: containerHeight * 0.06), // Gap between sections

            // Second row: Dynamic temperature value
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current $label', // Static label
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontFamily: 'Poppins',
                    fontSize: containerHeight * 0.08,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      value.toString(), // Dynamic value
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Poppins',
                        fontSize: containerHeight * 0.15, // Larger size for temperature
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4), // Small gap between value and unit
                    Text(
                      metric, // Dynamic metric
                      style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontFamily: 'Poppins',
                        fontSize: containerHeight * 0.08, // Smaller size for unit
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Color.fromRGBO(204, 204, 204, 1),
              thickness: 1,
            ),
            Text(
              'Normal Range: $range$metric', // Dynamic normal range
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(117, 117, 117, 1),
                fontFamily: 'Poppins',
                fontSize: containerHeight * 0.08,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

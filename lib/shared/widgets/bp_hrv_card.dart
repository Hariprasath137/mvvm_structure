import 'package:flutter/material.dart';

class BpHrvCard extends StatelessWidget {
  final String label;
  final String currentBPValue;
  final String mmHg;
  final String normalRange;

  // Constructor to accept dynamic values
  BpHrvCard({
    required this.label,
    required this.currentBPValue,
    required this.mmHg,
    required this.normalRange,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate width and height as a fraction of the screen size
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
            // First row: Label and > on the same line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label, // Use the dynamic label passed into the constructor
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
                  size: containerHeight * 0.15, // Adjust size
                ),
              ],
            ),
            SizedBox(height: containerHeight * 0.06), // Gap between sections

            // Second row: Current BP value and unit (e.g., 85 ms)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current $label", // Use dynamic label
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontFamily: 'Poppins',
                    fontSize: containerHeight * 0.09,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      currentBPValue, // Use dynamic currentBPValue
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Poppins',
                        fontSize: containerHeight * 0.20, // Larger font size for BP value
                        fontWeight: FontWeight.bold, // Bold style
                      ),
                    ),
                    SizedBox(width: 4), // Small gap between BP value and unit
                    Text(
                      mmHg, // Use dynamic mmHg unit
                      style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontFamily: 'Poppins',
                        fontSize: containerHeight * 0.09, // Smaller font size for "mmHg"
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: containerHeight * 0.06), // Gap between sections

            // Third row: Normal Range
            Text(
              "Normal Range: $normalRange", // Concatenate dynamic normalRange with the label
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(117, 117, 117, 1),
                fontFamily: 'Poppins',
                fontSize: containerHeight * 0.09, // Font size relative to container height
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StressCard extends StatelessWidget {
  final String levelValue;
  final String peakValue;
  final String tipText;

  // Correct constructor with required parameters
  StressCard({
    required this.levelValue,
    required this.peakValue,
    required this.tipText,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth = screenWidth * 0.45;
    double containerHeight = screenHeight * 0.32;

    double scaleFactor = 2; //40 / 15;  // 2.67

    return Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Stress",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(89, 89, 89, 1),
                    fontFamily: 'Poppins',
                    fontSize: containerHeight * 0.12 / scaleFactor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: containerHeight * 0.12 / scaleFactor,
                ),
              ],
            ),
            SizedBox(height: containerHeight * 0.02),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Level",
                  style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontFamily: 'Poppins',
                    fontSize: containerHeight * 0.08 / scaleFactor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  levelValue, // Dynamically passed value
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Poppins',
                    fontSize: containerHeight * 0.12 / scaleFactor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: containerHeight * 0.02),

                Text(
                  "Peak",
                  style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontFamily: 'Poppins',
                    fontSize: containerHeight * 0.08 / scaleFactor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  peakValue, // Dynamically passed value
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Poppins',
                    fontSize: containerHeight * 0.12 / scaleFactor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: containerHeight * 0.01),

            Container(
              height: containerHeight * 0.4,
              color: Colors.grey[200],
              child: Center(
                child: Text('Emotion Gauge'),
              ),
            ),

            SizedBox(height: containerHeight * 0.01),

            Divider(
              color: Color.fromRGBO(204, 204, 204, 1),
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),

            SizedBox(height: containerHeight * 0.01),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lightbulb,
                  color: Colors.black,
                  size: containerHeight * 0.08 / scaleFactor,
                ),
                SizedBox(width: 2),
                Text(
                  tipText, // Dynamically passed value
                  style: TextStyle(
                    color: Color.fromRGBO(89, 89, 89, 1),
                    fontFamily: 'Poppins',
                    fontSize: containerHeight * 0.08 / scaleFactor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

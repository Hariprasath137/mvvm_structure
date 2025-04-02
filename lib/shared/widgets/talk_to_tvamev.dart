import 'package:flutter/material.dart';

class TalkToTvamev extends StatelessWidget {
  const TalkToTvamev({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: const Color(0XFFCCCCCC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row spans full width
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Ensures full width usage
              children: [
                Image.asset(
                  "assets/tvamev.png",
                  height: screenWidth * 0.2, // Responsive image height
                ),
                SizedBox(width: screenWidth * 0.03), // Responsive spacing
                Expanded(
                  // Expands text to use available space
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Talk to Tvamev",
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: screenWidth * 0.06, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 0.01,
                      ), // Responsive spacing
                      Text(
                        "Get personalized workout plans",
                        style: TextStyle(
                          fontSize: screenWidth * 0.045, // Responsive font size
                          color: Color(0XFF595959),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.04), // Responsive spacing
            // Button spans full width
            SizedBox(
              width: double.infinity, // Makes the button full width
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFFFFFFFF), // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.02, // Responsive padding
                  ),
                ),
                child: Text(
                  "Start Chat",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Responsive font size
                    color: Color(0XFF1E1D1D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

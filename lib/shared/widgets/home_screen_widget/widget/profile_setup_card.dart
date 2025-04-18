import 'package:flutter/material.dart';

class ProfileSetup extends StatelessWidget {
  // Function to create the row with icon and text
  Widget buildRow(String text1, String text2, double screenWidth, double textScaleFactor) {
    double fontSize = screenWidth * 0.04 * textScaleFactor; // Adjust font size based on screen width and text scale factor
    double iconSize = screenWidth * 0.05; // Icon size based on screen width

    return Row(
      children: [
        // Left block (takes 60% of the width)
        Expanded(
          flex: 5, // Takes 60% of the row width
          child: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.black, size: iconSize),
              SizedBox(width: screenWidth * 0.02), // Adjust spacing based on screen width
              Text(
                text1,
                style: TextStyle(color: Colors.black, fontSize: fontSize),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5, // Takes 40% of the row width
          child: Align(
            alignment: Alignment.centerRight, // Aligns the content to the right
            child: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.black, size: iconSize),
                SizedBox(width: screenWidth * 0.02), // Adjust spacing based on screen width
                Text(
                  text2,
                  style: TextStyle(color: Colors.black, fontSize: fontSize),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProfileButton(double screenWidth, double textScaleFactor) {
    double buttonFontSize = screenWidth * 0.05 * textScaleFactor; // Dynamic font size for the button

    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3A4750),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Text(
          'Complete your profile setup',
          style: TextStyle(fontSize: buttonFontSize, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor; // Get the text scale factor

    // Dynamic height and padding based on screen size
    double containerHeight = screenHeight * 0.3;
    double paddingValue = screenWidth * 0.04;

    return Container(
      height: containerHeight, // 40% of the screen height
      decoration: BoxDecoration(
        color: Colors.white, // Container color
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color with opacity
            offset: Offset(0, 4), // Shadow offset (horizontal, vertical)
            blurRadius: 6, // Blur radius for the shadow
            spreadRadius: 1, // Spread radius for the shadow
          ),
        ], // Rounded corners for the whole container
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Ensure the inner containers follow the outer border radius
        child: Column(
          children: [
            // Top 35% container
            Container(
              height: containerHeight * 0.30, // 35% of the container's height (40% of screen height)
              child: Padding(
                padding: EdgeInsets.all(paddingValue), // Dynamic padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the texts and circle
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile Setup',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.05 * textScaleFactor, // Adjust font size based on text scale factor
                            fontWeight: FontWeight.bold, // Bold text for Profile Setup
                          ),
                        ),
                        Text(
                          '4 to 7 items completed',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.04 * textScaleFactor, // Adjust font size based on text scale factor
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: screenWidth * 0.12, // Dynamic width for the circle
                      height: screenWidth * 0.12, // Dynamic height for the circle
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black, // Color of the circle border
                          width: 2, // Border width
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '70%',
                          style: TextStyle(
                            color: Colors.black, // Text color inside the circle
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.04 * textScaleFactor, // Dynamic font size for percentage text
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom 65% container
            Container(
              height: containerHeight * 0.70, // 65% of the container's height (40% of screen height)
              child: Padding(
                padding: EdgeInsets.all(paddingValue), // Add dynamic padding for spacing
                child: Column(
                  children: [
                    // Use the buildRow method for the first row with 2 items
                    buildRow('Age', 'Gender', screenWidth, textScaleFactor),
                    SizedBox(height: paddingValue), // Dynamic space between rows
                    // Use the buildRow method for the second row with 2 items
                    buildRow('Weight', 'Height', screenWidth, textScaleFactor),
                    SizedBox(height: paddingValue), // Dynamic space between rows
                    // Use the buildRow method for the third row with 2 items
                    buildRow('Activity Level', 'Sleep Goals', screenWidth, textScaleFactor),
                    SizedBox(height: paddingValue), // Dynamic space between rows

                    // Use the buildProfileButton method to add the button
                    buildProfileButton(screenWidth, textScaleFactor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

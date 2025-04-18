import 'package:flutter/material.dart';

class FallandAFib extends StatelessWidget {
  final String titleText;            // Dynamic text for the title (e.g., "Fall Detection")
  final String statusText;           // Dynamic text for Fall Status (e.g., "No Falls Detected")
  final String contactName;          // Dynamic text for Emergency Contact Name
  final String contactPhoneNumber;   // Dynamic text for Emergency Contact Phone Number

  // Constructor to pass dynamic values
  FallandAFib({
    required this.titleText,           // Title dynamic value
    required this.statusText,          // Status dynamic value
    this.contactName = "",         // Contact Name dynamic value
    this.contactPhoneNumber = ""  // Contact Phone Number dynamic value
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate dynamic container width and height
    double containerWidth = screenWidth * 0.90; // 90% of screen width
    double containerHeight = screenHeight * 0.18; // 18% of screen height

    bool showEmergencyContact = contactName.isNotEmpty && contactPhoneNumber.isNotEmpty;

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
        padding: EdgeInsets.all(containerWidth * 0.05), // Padding around the entire container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // First row: Dynamic Title and > on the same line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titleText,  // Dynamic title
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(89, 89, 89, 1),
                    fontFamily: 'Poppins',
                    fontSize: containerHeight * 0.12, // Font size relative to container height
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: containerHeight * 0.1, // Icon size relative to container height
                ),
              ],
            ),
            SizedBox(height: containerHeight * 0.05), // Reduced gap between sections

            // Second row: No Falls Detected section with icon
            Row(
              children: <Widget>[
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.black,
                  size: containerHeight * 0.1, // Icon size
                ),
                SizedBox(width: containerWidth * 0.02), // Small gap between icon and text
                Text(
                  statusText,  // Dynamic status text
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(117, 117, 117, 1),
                    fontFamily: 'Poppins',
                    fontSize: containerHeight * 0.08, // Font size relative to container height
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: containerHeight * 0.1), // Reduced gap between sections


            // Third row: Emergency Contact section
        Expanded(
          child: Container(
            width: containerWidth * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromRGBO(233, 232, 232, 1),
            ),
            child: Padding(
              padding: EdgeInsets.all(containerWidth * 0.02),
              child: showEmergencyContact
                  ? Column(
                children: <Widget>[
                  // Emergency Contact Title and Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Emergency Contact',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color.fromRGBO(108, 108, 108, 1),
                          fontFamily: 'Poppins',
                          fontSize: containerHeight * 0.07,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Icon(
                        Icons.border_color_rounded,
                        color: Colors.black,
                        size: containerHeight * 0.08,
                      ),
                    ],
                  ),
                  SizedBox(height: containerHeight * 0.02), // Reduced gap between sections

                  // Name and Phone Number
                  Row(
                    children: <Widget>[
                      Text(
                        contactName,  // Dynamic contact name
                        style: TextStyle(
                          color: Color.fromRGBO(108, 108, 108, 1),
                          fontFamily: 'Poppins',
                          fontSize: containerHeight * 0.08,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Spacer(),  // Adding a spacer to push the second text to the right
                      Text(
                        contactPhoneNumber,  // Dynamic contact phone number
                        style: TextStyle(
                          color: Color.fromRGBO(108, 108, 108, 1),
                          fontFamily: 'Poppins',
                          fontSize: containerHeight * 0.08,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              )
                  : SizedBox.shrink(),  // If no contact info, render nothing
            ),
          ),)
          ],
        ),
      ),
    );
  }
}

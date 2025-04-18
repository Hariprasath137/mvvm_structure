import 'package:flutter/material.dart';

class MedicationCard extends StatelessWidget {
  final String time; // Time for the medication (e.g., '09:00 AM')
  final String medicationName; // Name of the medication (e.g., 'Amoxicillin')
  final String dosage; // Dosage of the medication (e.g., '500mg')
  final String pillCount; // Number of pills (e.g., '1 Pill')
  final bool isPassed; // Whether the medication has been taken or not

  // Constructor to receive dynamic values
  MedicationCard({
    required this.time,
    required this.medicationName,
    required this.dosage,
    required this.pillCount,
    required this.isPassed,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate container width and height as a fraction of the screen size
    double containerWidth = screenWidth * 0.90;
    double containerHeight = screenHeight * 0.16;

    // Dynamically calculate icon and font sizes
    double circleDiameter = containerWidth * 0.20;
    double iconSize = circleDiameter * 0.5;
    double fontSize = containerHeight * 0.11; // Base font size for general text
    double buttonFontSize = containerHeight * 0.11; // Font size for button

    return Container(
      // width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(245, 245, 245, 1),
        border: Border.all(
          color: Color.fromRGBO(204, 204, 204, 1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // 25% container with a circle and icon
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                width: circleDiameter,
                height: circleDiameter,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(204, 204, 204, 1),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.medical_services, // Medical icon
                  color: Colors.black54,
                  size: iconSize, // Set the icon size based on circle diameter
                ),
              ),
            ),
          ),
          // 75% container divided into two rows
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.all(4.0), // Add padding inside the 75% container
              child: Row(
                children: [
                  // First row (60% of 75%)
                  Expanded( // container a1
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Line 1: Time (bold) ^ Passed/Not Passed
                          Row(
                            children: [
                              Text(
                                time, // Dynamically passed time
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.circle,
                                size: fontSize * 0.3,
                                color: Colors.black,
                              ), // Bullet point
                              SizedBox(width: 6),
                              Text(
                                isPassed ? 'Passed' : 'Pending',
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: isPassed ? Colors.red : Colors.green,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: containerHeight * 0.04),
                          Text(
                            medicationName,
                            style: TextStyle(fontSize: fontSize, color: Colors.black54),
                          ),
                          // Line 3: Dosage and Pill count
                          SizedBox(height: containerHeight * 0.04),
                          Row(
                            children: [
                              Text(
                                dosage,
                                style: TextStyle(fontSize: fontSize, color: Colors.black45),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.circle,
                                size: fontSize * 0.3,
                                color: Colors.black,
                              ), // Bullet point
                              SizedBox(width: 6),
                              Text(
                                pillCount, // Dynamically passed pill count (e.g., '1 Pill')
                                style: TextStyle(fontSize: fontSize, color: Colors.black45),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Second row (40% of 75%)
                  Expanded( // container a2
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, // Center the button vertically
                          children: [
                            // Stretch button horizontally but without being too big
                            SizedBox(
                              // width: double.infinity,  // Make it stretch to available width
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle button click
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.black54,
                                  minimumSize: Size(double.infinity, 34), // Set height to 36
                                  padding: EdgeInsets.symmetric(horizontal: 20), // Adjust horizontal padding as needed
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Take',
                                  style: TextStyle(
                                    fontSize: buttonFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BPMValue extends StatefulWidget {
  final String bpm;
  const BPMValue({super.key, required this.bpm});

  @override
  State<BPMValue> createState() => _BPMValueState();
}

class _BPMValueState extends State<BPMValue> {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    // Set the size of the square card as a percentage of the screen width
    final squareSize = screenWidth * 0.22; // Responsive square size

    return SizedBox(
      height: squareSize, // Equal height and width
      width: squareSize, // Equal height and width
      child: Card(
        color: const Color(0XFF767A7B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            screenWidth * 0.05,
          ), // Responsive radius
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenWidth * 0.01,
          ), // Reduced padding for better fit
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            children: [
              Text(
                widget.bpm,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.05, // Slightly reduced font size
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: screenWidth * 0.005), // Minimal spacing
              Text(
                "bpm",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.03, // Slightly reduced font size
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

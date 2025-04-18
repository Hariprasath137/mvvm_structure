import 'package:flutter/material.dart';

class GreetingInfoWidget extends StatelessWidget {
  final String greetingMessage;
  final String batteryPercentage;
  final String date;
  final String connectionStatus;

  // Constructor for the widget to accept dynamic values
  GreetingInfoWidget({
    required this.greetingMessage,
    required this.batteryPercentage,
    required this.date,
    required this.connectionStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              greetingMessage,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                Text(
                  batteryPercentage,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.battery_6_bar_rounded, size: 24),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
            ),
            Text(
              connectionStatus,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}

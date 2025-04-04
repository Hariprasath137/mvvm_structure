import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/heart_rate/view/heart_rate_trends_full.dart';

class DetailsScreen extends StatelessWidget {
  final HeartRateEntry entry;

  const DetailsScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date and Time Picker
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    entry.timestamp,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),

            // BPM Display
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 150.0,
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(entry.status),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.favorite, color: Colors.red, size: 30.0),
                            Text(
                              entry.bpm,
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("BPM", style: TextStyle(fontSize: 16.0)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Chip(
                    label: Text(
                      entry.status,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color(0xFFA9AAAA),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),

            // Trend Graph Placeholder
            Text(
              "Today's Trend\nLast 24 hours",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 150.0,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Center(child: Text("Graph Placeholder")),
            ),
            SizedBox(height: 20.0),

            // Heart Rate Insight
            Text(
              "Heart Rate Insight",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              "Your heart rate is within the normal range for ${entry.activity}. Keep up the steady pace!",
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 20.0),

            // Recommendations
            Text(
              "Recommendations",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              "Stay hydrated and maintain your current pace. Your body is responding well to this.",
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}

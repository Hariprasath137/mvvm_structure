import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Sample input lists
  final List<String> activities = ["Walking", "Running", "Swimming"];
  final List<int> steps = [2500, 3, 500];
  final List<String> units = ["steps", "km", "m"];
  final List<int> goals = [5000, 5, 1000];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Boxed Container")),
        body: Align(
          alignment: Alignment.centerLeft,
          child: CarouselWidget(
            activities: activities,
            steps: steps,
            units: units,
            goals: goals,
          ),
        ),
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  final List<String> activities;
  final List<int> steps;
  final List<String> units;
  final List<int> goals;

  CarouselWidget({
    required this.activities,
    required this.steps,
    required this.units,
    required this.goals,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165, // Set height for the carousel to match the height of the container
      child: ListView.builder(
        // Make the ListView horizontal
        scrollDirection: Axis.horizontal,
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Horizontal padding between cards
            child: Container(
              width: 155, // Fixed width for the card
              height: 165, // Fixed height for the card
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: const Color(0x88EDEDED),
                border: Border.all(
                  color: const Color(0xDDCCCCCC),
                  width: 1,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Circle with the icon inside
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFEDEDED),
                        ),
                        child: Icon(
                          Icons.directions_walk, // This can be replaced with other icons for different activities
                          size: 24,
                          color: const Color(0xff4b5563),
                        ),
                      ),
                      SizedBox(height: 7), // Space between icon and text
                      // Text for activity (Walking, Running, Swimming)
                      Text(
                        activities[index],
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 3), // Space between activity and steps
                      // Text for steps with bold numbers
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: const Color(0xff4b5563),
                          ),
                          children: [
                            TextSpan(
                              text: "${steps[index]} ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: units[index],
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10), // Space between steps and Goal
                      // Text for Goal
                      Text(
                        "Goal: ${goals[index]} ${units[index]}",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: const Color(0xff4b5563),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

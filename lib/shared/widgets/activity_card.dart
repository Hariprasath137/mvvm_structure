// lib/widgets/carousel_widget.dart
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> activities = ["Walking", "Running", "Swimming"];
  final List<int> steps = [2500, 3, 500];
  final List<String> units = ["steps", "km", "m"];
  final List<int> goals = [5000, 5, 1000];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 155,
              height: 165,
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
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFEDEDED),
                        ),
                        child: Icon(
                          Icons.directions_walk,
                          size: 24,
                          color: const Color(0xff4b5563),
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        activities[index],
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 3),
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
                      SizedBox(height: 10),
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

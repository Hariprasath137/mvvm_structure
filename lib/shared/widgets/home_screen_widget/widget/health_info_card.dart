import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/home_screen/data/home_screen_model.dart';

class HealthTrackingInfoCard extends StatelessWidget {
  final List<HealthInfo> data;

  HealthTrackingInfoCard({required this.data});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize = screenWidth * 0.045;
    double subtitleFontSize = screenWidth * 0.035;
    double cardHeight = screenHeight * 0.25;
    double cardWidth = screenWidth * 0.8;
    double topSectionHeight = cardHeight * 0.65;
    double bottomSectionPadding = screenWidth * 0.04;

    return Container(
      height: cardHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            width: cardWidth,
            height: cardHeight,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromRGBO(229, 231, 235, 1),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: topSectionHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: Colors.white,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey[300],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(bottomSectionPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data[index].title, // Access title from HealthInfo model
                            style: TextStyle(
                              color: Color.fromRGBO(30, 29, 29, 1),
                              fontFamily: 'Poppins',
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: screenWidth * 0.05,
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Text(
                        data[index].subtitle, // Access subtitle from HealthInfo model
                        style: TextStyle(
                          color: Color.fromRGBO(118, 118, 118, 1),
                          fontFamily: 'Poppins',
                          fontSize: subtitleFontSize,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

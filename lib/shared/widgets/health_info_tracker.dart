import 'package:flutter/material.dart';

class TrackHealth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double titleFontSize = screenWidth * 0.05;
    double textSpacing = screenWidth * 0.02;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        color: Color.fromRGBO(241, 241, 241, 1),
      ),
      padding: EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildRowItem(context, 'Understand your body better', titleFontSize, textSpacing),
          buildRowItem(context, 'Improve sleep quality', titleFontSize, textSpacing),
          buildRowItem(context, 'Optimize your workouts', titleFontSize, textSpacing),
          buildRowItem(context, 'Manage stress levels', titleFontSize, textSpacing),

          Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.04,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Learn More',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontFamily: 'Poppins',
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.normal,
                    height: 2.2,
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: screenWidth * 0.035,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRowItem(BuildContext context, String text, double fontSize, double spacing) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.black,
              size: screenWidth * 0.04,
            ),
            SizedBox(width: spacing * 2),
            Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(118, 118, 118, 1),
                fontFamily: 'Poppins',
                fontSize: fontSize,
                fontWeight: FontWeight.normal,
                height: 1.4,
              ),
            ),
          ],
        ),
        SizedBox(height: spacing),
      ],
    );
  }
}

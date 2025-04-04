// import 'package:flutter/material.dart';
//
// class SleepCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Get the screen width and height
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     // Calculate dynamic container width and height
//     double containerWidth = screenWidth * 0.90; // 90% of screen width
//     double containerHeight = screenHeight * 0.20; // 18% of screen height
//
//     return Container(
//       height: containerHeight,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Color.fromRGBO(245, 245, 245, 1),
//         border: Border.all(
//           color: Color.fromRGBO(204, 204, 204, 1),
//           width: 1,
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.04), // Padding around the entire container
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // First row: Sleep title and arrow icon on the same line
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Sleep',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     color: Color.fromRGBO(89, 89, 89, 1),
//                     fontFamily: 'Poppins',
//                     fontSize: containerHeight * 0.12, // Font size relative to container height
//                     fontWeight: FontWeight.normal,
//                     height: 1,
//                   ),
//                 ),
//                 Icon(
//                   Icons.arrow_forward_ios,
//                   color: Colors.black,
//                   size: containerHeight * 0.1, // Icon size relative to container height
//                 ),
//               ],
//             ),
//             SizedBox(height: containerHeight * 0.05), // Reduced gap between sections
//
//             // Second row: 70% and 30% split
//             Expanded(
//               child: Row(
//                 children: [
//                   // AA Block (70%)
//                   Expanded(
//                     flex: 6, // 70% of space
//                     child: Container(
//                       color: Colors.black12, // For visualizing the block color
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: containerHeight * 0.02),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Row(
//                               children: <Widget>[
//                                 Icon(
//                                   Icons.check_circle_outline,
//                                   color: Colors.black,
//                                   size: containerHeight * 0.1, // Icon size
//                                 ),
//                                 SizedBox(width: containerWidth * 0.02), // Small gap between icon and text
//                                 Text(
//                                   '84% sleep quality',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     color: Color.fromRGBO(117, 117, 117, 1),
//                                     fontFamily: 'Poppins',
//                                     fontSize: containerHeight * 0.08, // Font size relative to container height
//                                     fontWeight: FontWeight.normal,
//                                     height: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: containerHeight * 0.02), // Gap between the two text rows
//                             Text(
//                               'You had a positive sleep last night',
//                               style: TextStyle(
//                                 color: Color.fromRGBO(117, 117, 117, 1),
//                                 fontFamily: 'Poppins',
//                                 fontSize: containerHeight * 0.06, // Smaller font for the second text
//                                 fontWeight: FontWeight.normal,
//                                 height: 1,
//                               ),
//                             ),
//                             SizedBox(height: containerHeight * 0.02),
//                             // Row of colored blocks, expanded vertically
//                             Expanded(
//                                 child: Row(
//                                   children: <Widget>[
//                                     // Row 1 (Red block) with rounded corners
//                                     Expanded(
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           // color: Colors.red, // Red color for the first column
//                                           borderRadius: BorderRadius.circular(10), // Circular corners
//                                         ),
//                                         child: Center(
//                                           child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             children: [
//                                               // Colored dot
//                                               Container(
//                                                 width: 10,
//                                                 height: 10,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.red, // Color of the dot
//                                                   shape: BoxShape.circle,
//                                                 ),
//                                               ),
//                                               SizedBox(height: 5), // Space between the dot and text
//                                               Text(
//                                                 'Deep', // Main text
//                                                 style: TextStyle(color: Colors.white),
//                                               ),
//                                               SizedBox(height: 5), // Space between the text and time
//                                               Text(
//                                                 '4h 20m', // Time below the main text
//                                                 style: TextStyle(color: Colors.white, fontSize: 12),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     // Row 2 (Green block) with rounded corners
//                                     Expanded(
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           // color: Colors.green, // Green color for the second column
//                                           borderRadius: BorderRadius.circular(10), // Circular corners
//                                         ),
//                                         child: Center(
//                                           child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             children: [
//                                               // Colored dot
//                                               Container(
//                                                 width: 10,
//                                                 height: 10,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.green, // Color of the dot
//                                                   shape: BoxShape.circle,
//                                                 ),
//                                               ),
//                                               SizedBox(height: 5), // Space between the dot and text
//                                               Text(
//                                                 'Light', // Main text
//                                                 style: TextStyle(color: Colors.white),
//                                               ),
//                                               SizedBox(height: 5), // Space between the text and time
//                                               Text(
//                                                 '2h 20m', // Time below the main text
//                                                 style: TextStyle(color: Colors.white, fontSize: 12),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     // Row 3 (Blue block) with rounded corners
//                                     Expanded(
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           // color: Colors.blue, // Blue color for the third column
//                                           borderRadius: BorderRadius.circular(10), // Circular corners
//                                         ),
//                                         child: Center(
//                                           child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             children: [
//                                               // Colored dot
//                                               Container(
//                                                 width: 10,
//                                                 height: 10,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.blue, // Color of the dot
//                                                   shape: BoxShape.circle,
//                                                 ),
//                                               ),
//                                               SizedBox(height: 5), // Space between the dot and text
//                                               Text(
//                                                 'Awake', // Main text
//                                                 style: TextStyle(color: Colors.white),
//                                               ),
//                                               SizedBox(height: 5), // Space between the text and time
//                                               Text(
//                                                 '1h 20m', // Time below the main text
//                                                 style: TextStyle(color: Colors.white, fontSize: 12),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     // Row 4 (Orange block) with rounded corners
//                                     Expanded(
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           // color: Colors.orange, // Orange color for the fourth column
//                                           borderRadius: BorderRadius.circular(10), // Circular corners
//                                         ),
//                                         child: Center(
//                                           child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             children: [
//                                               // Colored dot
//                                               Container(
//                                                 width: 10,
//                                                 height: 10,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.orange, // Color of the dot
//                                                   shape: BoxShape.circle,
//                                                 ),
//                                               ),
//                                               SizedBox(height: 5), // Space between the dot and text
//                                               Text(
//                                                 'REM', // Main text
//                                                 style: TextStyle(color: Colors.white),
//                                               ),
//                                               SizedBox(height: 5), // Space between the text and time
//                                               Text(
//                                                 '30m', // Time below the main text
//                                                 style: TextStyle(color: Colors.white, fontSize: 12),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   // SizedBox(width: containerWidth * 0.01), // Gap between AA and BB blocks
//
//                   // BB Block (30%)
//                   Expanded(
//                     flex: 4, // 30% of space
//                     child: Container(
//                       color: Colors.grey[300],
//                       child: Center(
//                         child: Text('Sleep Duration Chart'),
//                       ),// Dummy color for BB block
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class SleepCard extends StatelessWidget {
  final double sleepQuality; // Input: Sleep Quality (e.g., 84)
  final List<Map<String, String>> sleepStages; // Input: List of sleep stages with time

  // Constructor to accept data when widget is called
  SleepCard({required this.sleepQuality, required this.sleepStages});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate dynamic container width and height
    double containerWidth = screenWidth * 0.90; // 90% of screen width
    double containerHeight = screenHeight * 0.20; // 18% of screen height

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
        padding: EdgeInsets.all(screenWidth * 0.04), // Padding around the entire container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // First row: Sleep title and arrow icon on the same line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sleep',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(89, 89, 89, 1),
                    fontFamily: 'Poppins',
                    fontSize: containerHeight * 0.10, // Font size relative to container height
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

            // Second row: 70% and 30% split
            Expanded(
              child: Row(
                children: [
                  // AA Block (70%)
                  Expanded(
                    flex: 6, // 70% of space
                    child: Container(
                      // color: Colors.black12, // For visualizing the block color
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: containerHeight * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.black,
                                  size: containerHeight * 0.1, // Icon size
                                ),
                                SizedBox(width: containerWidth * 0.02), // Small gap between icon and text
                                Text(
                                  '$sleepQuality% sleep quality', // Dynamic sleep quality
                                  textAlign: TextAlign.left,
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
                            SizedBox(height: containerHeight * 0.02), // Gap between the two text rows
                            Text(
                              'You had a positive sleep last night',
                              style: TextStyle(
                                color: Color.fromRGBO(117, 117, 117, 1),
                                fontFamily: 'Poppins',
                                fontSize: containerHeight * 0.06, // Smaller font for the second text
                                fontWeight: FontWeight.normal,
                                height: 1,
                              ),
                            ),
                            SizedBox(height: containerHeight * 0.02),
                            // Dynamic sleep stages
                            Expanded(
                              child: Row(
                                children: sleepStages.map((stage) {
                                  return Expanded(
                                    child: _buildSleepStageBlock(stage),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // BB Block (30%)
              Expanded(
                flex: 4, // 30% of space
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Background color for the box
                    borderRadius: BorderRadius.circular(16), // Rounded corners
                    // border: Border.all(
                    //   color: Colors.grey, // Border color
                    //   width: 1, // Border width
                    // ),
                  ),
                  child: Center(
                    child: Text('Sleep Duration Chart'),
                  ),
                ),
              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each sleep stage block
  Widget _buildSleepStageBlock(Map<String, String> stageData) {
    Color color;
    switch (stageData['stage']) {
      case 'Deep':
        color = Colors.red;
        break;
      case 'Light':
        color = Colors.green;
        break;
      case 'Awake':
        color = Colors.blue;
        break;
      case 'REM':
        color = Colors.orange;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15), // Circular corners
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Colored dot
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: color, // Color of the dot
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 5), // Space between the dot and text
            Text(
              stageData['stage']!, // Main text (Deep, Light, Awake, REM)
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5), // Space between the text and time
            Text(
              stageData['time']!, // Time below the main text
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

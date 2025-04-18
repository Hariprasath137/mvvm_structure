import 'package:flutter/material.dart';

// Define a model to store each section's data
class ProgressData {
  final IconData icon;
  final String title;
  final double progress;
  final String progressText;
  final Color progressColor;

  ProgressData({
    required this.icon,
    required this.title,
    required this.progress,
    required this.progressText,
    required this.progressColor,
  });
}

// Define the reusable GoalProgressCard widget with dynamic data
class GoalProgressCard extends StatelessWidget {
  // List of progress data (you can add more items to this list)
  final List<ProgressData> progressList = [
    ProgressData(
      icon: Icons.directions_walk,
      title: 'Steps',
      progress: 2000 / 5000,
      progressText: '2000/5000',
      progressColor: Colors.red,
    ),
    ProgressData(
      icon: Icons.fitness_center,
      title: 'Workout Progress',
      progress: 2500 / 5000,
      progressText: '2500/5000',
      progressColor: Colors.brown,
    ),
    ProgressData(
      icon: Icons.water_rounded,
      title: 'Swimming Progress',
      progress: 800 / 1000,
      progressText: '800/1000',
      progressColor: Colors.blue,
    ),
    // You can add more goals here as needed
  ];

  // Helper method to build a progress row dynamically
  Widget buildProgressRow(ProgressData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row with Icon and Title for each section
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                data.icon,
                size: 24,
                color: data.progressColor,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: data.progress,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(data.progressColor),
                  ),
                  SizedBox(height: 8),
                  Text(
                    data.progressText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8), // Reduced space between progress sections
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get the screen's width and height for dynamic padding
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Dynamically calculate padding based on screen size
    double horizontalPadding = screenWidth * 0.05; // 5% of the screen width
    double verticalPadding = screenHeight * 0.03; // Adjusted vertical padding (higher)
    double contentPadding = screenWidth * 0.05; // Adjusted content padding (higher)

    // Helper function to show Snackbar
    void showSnackbar(BuildContext context, String message) {
      final snackBar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Container(
      color: Colors.yellowAccent, // Full-width yellow background
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensure the column only takes the space it needs
          children: [
            // Title row with "Daily Goals" and "Edit Goals"
            Row(
              children: [
                Text(
                  'Daily Goals',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    // Show Snackbar when Edit Goals is clicked
                    showSnackbar(context, 'Edit Goals button clicked!');
                  },
                  child: Row(
                    children: [
                      Text(
                        'Edit Goals',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 6), // Space between text and icon
                      Icon(
                        Icons.border_color_rounded,
                        color: Colors.black,
                        size: 16, // Define a fixed size for the icon
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16), // Space between Daily Goals and Goal Progress card

            // Goal Progress Content (Card) wrapped with InkWell for entire card
            InkWell(
              onTap: () {
                showSnackbar(context, 'Goal Progress card clicked!');
              },
              child: Container(
                padding: EdgeInsets.all(contentPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align everything to the left
                  children: [
                    // Title row with "Goal Progress" and forward arrow icon
                    Row(
                      children: [
                        Text(
                          'Goal Progress',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16), // Space between title and content

                    // Use ListView.builder to generate the dynamic sections
                    ...progressList.map(buildProgressRow).toList(),
                  ],
                ),
              ),
            ),

            // Add extra padding below to ensure the yellow space ends neatly
            SizedBox(height: 16), // Adjust as necessary

            // New section for clickable "+ Add New Goals"
            // New section for clickable "+ Add New Goals"
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      // Show Snackbar when Add New Goals is clicked
                      showSnackbar(context, 'Add New Goals button clicked!');
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Add new goals',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
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
}

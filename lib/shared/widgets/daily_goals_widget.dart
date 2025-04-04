import 'package:flutter/material.dart';

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

class GoalProgressCard extends StatelessWidget {
  // Constructor to accept dynamic progress list
  final List<ProgressData> progressList;

  GoalProgressCard({
    required this.progressList,
  });

  // Method to build each progress row
  Widget buildProgressRow(ProgressData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              child: Icon(data.icon, size: 24, color: data.progressColor),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: data.progress,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      data.progressColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    data.progressText,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }

  // Method to show Snackbar
  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double horizontalPadding = screenWidth * 0.05;
    double verticalPadding = screenHeight * 0.03;
    double contentPadding = screenWidth * 0.05;

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(height: 16),
                  // Dynamically build each progress row
                  ...progressList.map(buildProgressRow).toList(),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    showSnackbar(context, 'Add New Goals button clicked!');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add, color: Colors.black, size: 20),
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
    );
  }
}

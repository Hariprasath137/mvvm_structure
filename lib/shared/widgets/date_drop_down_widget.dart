import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateNavigationWidget extends StatefulWidget {
  const DateNavigationWidget({super.key});

  @override
  _DateNavigationWidgetState createState() => _DateNavigationWidgetState();
}

class _DateNavigationWidgetState extends State<DateNavigationWidget> {
  String dropdownValue = 'Daily';
  DateTime currentDate = DateTime.now();

  void _changeDate(int days) {
    setState(() {
      currentDate = currentDate.add(Duration(days: days));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  screenWidth * 0.06,
                ), // Responsive radius
              ),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, // Reduced padding
                vertical: screenHeight * 0.01,
              ),
            ),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(
                Icons.keyboard_arrow_down_sharp,
                size: screenWidth * 0.06, // Responsive icon size
                color: Colors.black,
              ),
              underline: const SizedBox(),
              items:
                  ['Daily', 'Weekly', 'Monthly'].map<DropdownMenuItem<String>>((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: screenWidth * 0.035, // Responsive font size
                          fontWeight: FontWeight.w500,
                          color: const Color(0XFF333333),
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(
                screenWidth * 0.02,
              ), // Responsive radius
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.035, // Responsive font size
              ),
              elevation: 5,
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.15), // Responsive spacing

        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: screenWidth * 0.05, // Responsive icon size
          ),
          onPressed: () => _changeDate(-1),
        ),

        Expanded(
          child: Text(
            'Today, ${DateFormat('MMM d').format(currentDate)}',
            textAlign: TextAlign.center, // Center-align text
            style: TextStyle(
              fontSize: screenWidth * 0.035, // Responsive font size
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis, // Prevent overflow
            maxLines: 1, // Limit to one line
          ),
        ),

        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            size: screenWidth * 0.05, // Responsive icon size
          ),
          onPressed:
              currentDate.isBefore(
                    DateTime.now().subtract(const Duration(days: 1)),
                  )
                  ? () => _changeDate(1)
                  : null,
        ),
      ],
    );
  }
}

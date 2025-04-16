// ignore_for_file: deprecated_member_use

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
    
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

   
    final TextScaler textScaler = MediaQuery.textScalerOf(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                screenWidth * 0.04,
              ), 
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.01, 
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: textScaler.scale(
                    screenWidth * 0.06,
                  ), 
                  color: Colors.black,
                ),
                underline: const SizedBox(),
                items:
                    [
                      'Daily',
                      'Weekly',
                      'Monthly',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: textScaler.scale(
                              screenWidth * 0.035,
                            ), 
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
                  textScaler.scale(screenWidth * 0.02),
                ), 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: textScaler.scale(
                    screenWidth * 0.035,
                  ),
                ),
                elevation: 5,
              ),
            ),
          ),
        ),

        SizedBox(
          width: textScaler.scale(screenWidth * 0.15),
        ), 
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: textScaler.scale(screenWidth * 0.05), 
          ),
          onPressed: () => _changeDate(-1),
        ),

        Expanded(
          child: Text(
            'Today, ${DateFormat('MMM d').format(currentDate)}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: textScaler.scale(
                screenWidth * 0.035,
              ), 
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis, 
            maxLines: 1, 
          ),
        ),

        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            size: textScaler.scale(screenWidth * 0.05), 
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

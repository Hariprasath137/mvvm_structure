import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020, 5),
      lastDate: DateTime(2060),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Format the date to a readable format using the 'intl' package
    String formattedDate = DateFormat('d MMM').format(selectedDate); // add yyyy for Year

    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.grey[300],
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_left),
              onPressed: () {
                // Logic to go to the previous date can be implemented here
              },
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Row(
                children: [
                  Icon(Icons.calendar_month_outlined, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'Today, $formattedDate',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: () {
                // Logic to go to the next date can be implemented here
              },
              color: Colors.grey,
            ),
          ],
        ),
        Container(
          height: 1,
          color: Colors.grey[300],
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
      ],
    );
  }
}

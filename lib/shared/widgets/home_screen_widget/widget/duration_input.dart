import 'package:flutter/material.dart';

class DurationInput extends StatefulWidget {
  @override
  _DurationInputState createState() => _DurationInputState();
}

class _DurationInputState extends State<DurationInput> {
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();

  // Default start time and end time
  TimeOfDay _startTime = TimeOfDay(hour: 14, minute: 45); // 2:45 PM
  TimeOfDay _endTime = TimeOfDay(hour: 15, minute: 15);   // 3:15 PM

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Set the initial values for the text controllers
    _startTimeController.text = _startTime.format(context);
    _endTimeController.text = _endTime.format(context);
  }

  // Function to show time picker
  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = pickedTime;
          _startTimeController.text = pickedTime.format(context);
        } else {
          _endTime = pickedTime;
          _endTimeController.text = pickedTime.format(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double smallSpacing = 16.0; // Increased spacing to ensure they don't touch

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Start Time Column with Title and TextField
        Expanded(
          flex: 5, // flex value to take 50% space
          child: Padding(
            padding: EdgeInsets.only(right: 0), // Add space between columns
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Start Time'),
                SizedBox(height: 4.0), // Space between title and input
                TextField(
                  controller: _startTimeController,
                  readOnly: true, // Disable manual input
                  onTap: () => _selectTime(context, true), // Time picker on tap
                  decoration: InputDecoration(
                    hintText: '2:45 PM',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(width: 20),
        // End Time Column with Title and TextField
        Expanded(
          flex: 5, // flex value to take 50% space
          child: Padding(
            padding: EdgeInsets.only(left: 0), // Add space between columns
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('End Time'),
                SizedBox(height: 4.0), // Space between title and input
                TextField(
                  controller: _endTimeController,
                  readOnly: true, // Disable manual input
                  onTap: () => _selectTime(context, false), // Time picker on tap
                  decoration: InputDecoration(
                    hintText: '3:15 PM',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

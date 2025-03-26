// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          ),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 30,
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
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF333333),
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
            borderRadius: BorderRadius.circular(15),
            style: const TextStyle(color: Colors.black, fontSize: 16),
            elevation: 5,
          ),
        ),
        const SizedBox(width: 20),

        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => _changeDate(-1),
        ),

        Text(
          'Today, ${DateFormat('MMM d').format(currentDate)}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
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

import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/shared/widgets/bpm_value_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/custom_button.dart';

class HeartRateTrends extends StatefulWidget {
  const HeartRateTrends({super.key});

  @override
  State<HeartRateTrends> createState() => _HeartRateTrendsState();
}

class _HeartRateTrendsState extends State<HeartRateTrends> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFFF6F8F9),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 24, right: 24, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Heart Rate Trends",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      "View all",
                      style: TextStyle(
                        color: Color(0XFF193238),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Color(0XFF193238)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Main Content Row
            Row(
              children: [
                // BPM Widget on the Left
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                    bottom: 20,
                  ), // Shift BPM slightly upwards
                  child: BPMValue(bpm: "76"),
                ),
                const SizedBox(width: 6),
                // Column for CardButton, Text, and Date
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          CardButton(value: "Normal"),
                          SizedBox(width: 8),
                          Text(
                            "Exercise",
                            style: TextStyle(
                              color: Color(0XFF193238),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "11th Dec 2024, 10:54 AM",
                          style: TextStyle(
                            color: Color(0XFF193238),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Divider(thickness: 1),
                    ],
                  ),
                ),
                // IconButton at the End, Centered Vertically
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                // BPM Widget on the Left
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                    bottom: 10,
                  ), // Shift BPM slightly upwards
                  child: BPMValue(bpm: "76"),
                ),
                const SizedBox(width: 6),
                // Column for CardButton, Text, and Date
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          CardButton(value: "Normal"),
                          SizedBox(width: 8),
                          Text(
                            "Exercise",
                            style: TextStyle(
                              color: Color(0XFF193238),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "11th Dec 2024, 10:54 AM",
                          style: TextStyle(
                            color: Color(0XFF193238),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // IconButton at the End, Centered Vertically
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HeartRateTable extends StatefulWidget {
  final String title; // Changeable title

  const HeartRateTable({super.key, required this.title});

  @override
  _HeartRateTableState createState() => _HeartRateTableState();
}

class _HeartRateTableState extends State<HeartRateTable> {
  bool isExpanded = false;

  final List<Map<String, String>> heartRateData = [
    {"age": "Under 1", "range": "115-137"},
    {"age": "1-1", "range": "107-122"},
    {"age": "2-3", "range": "96-112"},
    {"age": "4-5", "range": "84-100"},
    {"age": "6-8", "range": "76-92"},
    {"age": "9-11", "range": "70-86"},
    {"age": "12-15", "range": "66-83"},
    {"age": "16-19", "range": "61-78"},
    {"age": "20-39", "range": "61-76"},
    {"age": "40-59", "range": "61-77"},
    {"age": "60-79", "range": "60-75"},
    {"age": "80 or over", "range": "61-78"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Reduced padding for responsiveness
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with custom color
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF191919), // Custom color for the title
            ),
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 200), // Set a minimum height
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildTableHeader(),
                    Column(
                      children:
                          (isExpanded
                                  ? heartRateData
                                  : heartRateData.take(3).toList())
                              .asMap()
                              .entries
                              .map((entry) {
                                final isLastItem =
                                    entry.key ==
                                    (isExpanded ? heartRateData.length - 1 : 2);
                                return _buildTableRow(
                                  entry.value["age"]!,
                                  entry.value["range"]!,
                                  isLastItem,
                                );
                              })
                              .toList(),
                    ),
                    const SizedBox(height: 10), // Space before the button
                    Align(
                      alignment:
                          Alignment.centerLeft, // Aligns to "Age group" column
                      child: _buildSeeMoreLessButton(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0XFFCCCCCC), // Background color for header
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ), // Rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Age Group title
          SizedBox(
            width: 100, // Ensuring proper alignment
            child: Text(
              "Age group",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF191919),
              ),
            ),
          ),
          // Average range (bpm) title in two lines
          SizedBox(
            width: 100, // Ensuring proper alignment
            child: Column(
              children: const [
                Text(
                  "Average range",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF191919),
                  ),
                ),
                Text(
                  "(bpm)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF191919),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(String age, String range, bool isLastItem) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100, // Same width as header
                child: Text(
                  age,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight:
                        age == "20-39" ? FontWeight.bold : FontWeight.normal,
                    color: const Color(0XFF767676), // Custom text color
                  ),
                ),
              ),
              SizedBox(
                width: 100, // Same width as header
                child: Text(
                  range,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight:
                        age == "20-39" ? FontWeight.bold : FontWeight.normal,
                    color: const Color(0XFF767676), // Custom text color
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!isLastItem) // ✅ Add divider only if it's NOT the last item
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Divider(color: Color(0XFF637887), thickness: 0.5),
          ),
      ],
    );
  }

  Widget _buildSeeMoreLessButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 36,
      ), // Aligns button under "Age group"
      child: Align(
        alignment:
            Alignment.centerLeft, // Ensures button aligns with "Age group"
        child: TextButton(
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero, // Removes extra padding
            alignment: Alignment.centerLeft, // Aligns text & icon properly
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Prevents extra space in Row
            children: [
              Text(
                isExpanded ? "See Less" : "See More",
                style: const TextStyle(fontSize: 16, color: Color(0XFF121417)),
              ),
              const SizedBox(width: 5), // Adds space between text and icon
              Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 24,
                color: const Color(0XFF000000),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

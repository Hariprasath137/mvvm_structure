import 'package:flutter/material.dart';

class HeartRateTable extends StatefulWidget {
  final String title; 

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
      padding: const EdgeInsets.all(16.0), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF191919), 
            ),
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 200), 
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
                    const SizedBox(height: 10), 
                    Align(
                      alignment:
                          Alignment.centerLeft, 
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
        color: const Color(0XFFCCCCCC), 
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          SizedBox(
            width: 100, 
            child: Text(
              "Age group",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF191919),
              ),
            ),
          ),
          
          SizedBox(
            width: 100, 
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
                width: 100, 
                child: Text(
                  age,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight:
                        age == "20-39" ? FontWeight.bold : FontWeight.normal,
                    color: const Color(0XFF767676), 
                  ),
                ),
              ),
              SizedBox(
                width: 100, 
                child: Text(
                  range,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight:
                        age == "20-39" ? FontWeight.bold : FontWeight.normal,
                    color: const Color(0XFF767676), 
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!isLastItem)
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
      ), 
      child: Align(
        alignment:
            Alignment.centerLeft, 
        child: TextButton(
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero, 
            alignment: Alignment.centerLeft, 
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, 
            children: [
              Text(
                isExpanded ? "See Less" : "See More",
                style: const TextStyle(fontSize: 16, color: Color(0XFF121417)),
              ),
              const SizedBox(width: 5),
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

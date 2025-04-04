// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ImprovementSuggestions extends StatelessWidget {
  const ImprovementSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if the screen is narrow (e.g., mobile) or wide (e.g., tablet/desktop)

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  "Suggestions for Improvement",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis, // Prevent overflow
                  maxLines: 2, // Limit to two lines if necessary
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildCustomExpansionTile(
                      title: "Aerobic Exercises",
                      description:
                          "Regular aerobic exercise (e.g., walking, cycling).",
                      isFirst: true,
                    ),
                    _buildCustomExpansionTile(
                      title: "Sleep Well",
                      description:
                          "Ensure 7-9 hours of quality sleep every night.",
                    ),
                    _buildCustomExpansionTile(
                      title: "Manage Stress",
                      description:
                          "Practice relaxation techniques such as meditation and deep breathing.",
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCustomExpansionTile({
    required String title,
    required String description,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(isFirst ? 12.0 : 0),
        topRight: Radius.circular(isFirst ? 12.0 : 0),
        bottomLeft: Radius.circular(isLast ? 12.0 : 0),
        bottomRight: Radius.circular(isLast ? 12.0 : 0),
      ),
      child: CustomExpansionTile(
        title: title,
        description: description,
        isLast: isLast,
      ),
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String description;
  final bool isLast;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.description,
    this.isLast = false,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
            childrenPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            title: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis, // Prevent overflow
              maxLines: 1, // Limit to one line
            ),
            trailing: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: 24,
            ),
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isExpanded = expanded;
              });
            },
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.description,
                  style: const TextStyle(color: Colors.black54),
                  overflow: TextOverflow.fade, // Fade overflowed text
                  softWrap: true, // Allow text to wrap
                ),
              ),
            ],
          ),
        ),
        if (!widget.isLast)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Divider(height: 1, thickness: 1, color: Colors.grey),
          ),
      ],
    );
  }
}

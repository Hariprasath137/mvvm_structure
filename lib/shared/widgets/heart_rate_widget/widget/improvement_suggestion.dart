// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ImprovementSuggestions extends StatelessWidget {
  final List<Map<String, String>> suggestions; 
  final String title; 
  const ImprovementSuggestions({
    super.key,
    required this.suggestions,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
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
                  children: suggestions.asMap().entries.map((entry) {
                    final index = entry.key;
                    final suggestion = entry.value;

                    return _buildCustomExpansionTile(
                      title: suggestion['title']!,
                      description: suggestion['description']!,
                      isFirst: index == 0,
                      isLast: index == suggestions.length - 1,
                    );
                  }).toList(),
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
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
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
                  overflow: TextOverflow.fade,
                  softWrap: true,
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

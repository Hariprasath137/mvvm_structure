import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/heart_rate/viewmodel/heart_rate_viewmodel.dart';
import 'package:provider/provider.dart';

class HeartRateTable extends StatefulWidget {
  const HeartRateTable({super.key});

  @override
  State<HeartRateTable> createState() => HeartRateTableState();
}

class HeartRateTableState extends State<HeartRateTable> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<HeartRateViewModel>(
      builder: (context, viewModel, child) {
        final table = viewModel.heartTableModel;

        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.error != null) {
          return Center(child: Text('Error: ${viewModel.error}'));
        }

        if (table == null) {
          return const Center(child: Text("No data available."));
        }

        final visibleData =
            isExpanded ? table.data : table.data.take(3).toList();

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Heart Rate Table",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF191919),
                ),
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 200),
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
                              visibleData.asMap().entries.map((entry) {
                                final isLast =
                                    entry.key == visibleData.length - 1;
                                return _buildTableRow(
                                  entry.value.age,
                                  entry.value.range,
                                  isLast,
                                );
                              }).toList(),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _buildToggleButton(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0XFFCCCCCC),
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SizedBox(
            width: 100,
            child: Text(
              "Age group",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF191919),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Column(
              children: [
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
          const Divider(height: 1, color: Color(0xFFE0E0E0), thickness: 1),
      ],
    );
  }

  Widget _buildToggleButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isExpanded ? "See Less" : "See More",
            style: const TextStyle(fontSize: 16, color: Color(0XFF121417)),
          ),
          const SizedBox(width: 5),
          Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            size: 24,
            color: const Color(0XFF000000),
          ),
        ],
      ),
    );
  }
}

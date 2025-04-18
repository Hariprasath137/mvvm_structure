// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/viewmodel/blood_pressure_viewmodel.dart';
import 'package:mvvm_structure_reference/shared/widgets/blood_pressure_widget/widget/bp_min_peak_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/blood_pressure_widget/widget/bp_table_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/close_slider_item_widget.dart'
    as swipableCard;
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/close_slider_item_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/blood_pressure_widget/graph/bp_chart.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/improvement_suggestion.dart';
import 'package:provider/provider.dart';

class MaximumBp extends StatelessWidget {
  const MaximumBp({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BloodPressureViewModel>();

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final chartData = viewModel.bpChart;
    final minBp = viewModel.minbp!;

    if (chartData == null || chartData.isEmpty) {
      return const Center(child: Text('No data found'));
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Minimum Blood Pressure"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "What is Minimum Blood Pressure?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Minimum blood pressure, also known as diastolic blood pressure, is the lowest pressure in your arteries when the heart rests between beats. It indicates how well your arteries relax and refill with blood.",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  BpMinPeakCard(title: minBp.title, value: minBp.value),
                  const SizedBox(height: 20),
                  BpChart(chartData: chartData),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Insights for you",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 20),
                        HorizontalCardWidget(
                          cards: [
                            swipableCard.InsightCard(
                              imagePath: 'assets/Rectangle.png',
                              text:
                                  'Your BP is within a healthy range. Maintaining this level supports overall cardiovascular health.',
                            ),
                            swipableCard.InsightCard(
                              imagePath: 'assets/Rectangle.png',
                              text:
                                  'Your BP is within a healthy range. Maintaining this level supports overall cardiovascular health.',
                            ),
                            swipableCard.InsightCard(
                              imagePath: 'assets/Rectangle.png',
                              text:
                                  'Your BP is within a healthy range. Maintaining this level supports overall cardiovascular health.',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 300),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BpTable(),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 300),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImprovementSuggestions(
                  suggestions: [
                    {
                      "title": "Healthy Diet",
                      "description":
                          "Regular healthy meals (e.g., fruits, vegetable,whole grains).",
                    },
                    {
                      "title": "Exercise Regularly",
                      "description": "Ensure 1 hours of exercise every day.",
                    },
                    {
                      "title": "Manage Stress",
                      "description":
                          "Practice relaxation techniques such as meditation and deep breathing.",
                    },
                  ],
                  title: 'Suggestions for Improvement',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/repository/heart_rate_repository.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/avg_resting_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/close_slider_item_widget.dart'
    as swipableCard;
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/close_slider_item_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/graph/heart_rate_graph.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/heart_rate_range.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/improvement_suggestion.dart';

class PeakHr extends StatefulWidget {
  const PeakHr({super.key});

  @override
  State<PeakHr> createState() => _PeakHrState();
}

class _PeakHrState extends State<PeakHr> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HeartRateData>(
      future: HeartRateRepository.loadHeartRateData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading data: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data found'));
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: Text("Peak HR"),
            centerTitle: true,
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What is Peak Heart Rate?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Peak heart rate is the highest HR recorded during a given period, often during physical activity.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      const AvgRestingCard(),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 350,
                        child: HeartRateGraph(model: snapshot.data!),
                      ),
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
                                      'Your RHR is within a healthy range. Maintaining this level is beneficial for cardiovascular health.',
                                ),
                                swipableCard.InsightCard(
                                  imagePath: 'assets/Rectangle.png',
                                  text:
                                      'Your RHR is within a healthy range. Maintaining this level is beneficial for cardiovascular health.',
                                ),
                                swipableCard.InsightCard(
                                  imagePath: 'assets/Rectangle.png',
                                  text:
                                      'Your RHR is within a healthy range. Maintaining this level is beneficial for cardiovascular health.',
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
                    child: HeartRateTable(),
                  ),
                ),

                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 300),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImprovementSuggestions(
                      suggestions: [
                        {
                          "title": "Aerobic Exercises",
                          "description":
                              "Regular aerobic exercise (e.g., walking, cycling).",
                        },
                        {
                          "title": "Sleep Well",
                          "description":
                              "Ensure 7-9 hours of quality sleep every night.",
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
      },
    );
  }
}

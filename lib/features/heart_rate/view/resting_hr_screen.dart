// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/shared/widgets/card/avg_resting_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/close_slider_item_widget.dart'
    as swipableCard;
import 'package:mvvm_structure_reference/shared/widgets/close_slider_item_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/heart_rate_graph.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_range.dart';
import 'package:mvvm_structure_reference/shared/widgets/improvement_suggestion.dart';

class RestingHr extends StatefulWidget {
  const RestingHr({super.key});

  @override
  State<RestingHr> createState() => _RestingHrState();
}

class _RestingHrState extends State<RestingHr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Resting HR"),
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
                    "What is Resting Heart Rate?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Resting heart rate (RHR) is the number of heartbeats per minute when you're at rest. It indicates your baseline heart health.",
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
                    child:
                        const HeartRateGraph(), 
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
              child: HeartRateTable(title: "Resting heart rate range"),
            ),

            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 300),
              child: ImprovementSuggestions(),
            ),
          ],
        ),
      ),
    );
  }
}

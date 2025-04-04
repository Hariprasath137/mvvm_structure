// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_structure_reference/shared/widgets/card/peak_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/card/resting_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/close_slider_item_widget.dart'
    as swipableCard;
import 'package:mvvm_structure_reference/shared/widgets/daily_summary_widget.dart.dart';
import 'package:mvvm_structure_reference/shared/widgets/date_drop_down_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/ecg_animation_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/factors_heart_rate.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/heart_rate_graph.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/v02_max_analysis.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_trends.dart';
import 'package:mvvm_structure_reference/shared/widgets/online_doctor_consultation.dart';
import 'package:mvvm_structure_reference/shared/widgets/swipable_card_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/talk_to_tvamev.dart';

import '../../../shared/widgets/close_slider_item_widget.dart';

class HeartRateScreen extends StatefulWidget {
  const HeartRateScreen({super.key});

  @override
  State<HeartRateScreen> createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Heart Rate",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/share_icon.svg'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/download_icon.svg'),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            // Insights Section
            Padding(
              padding: const EdgeInsets.all(24.0),
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
                            'Your resting heart rate is 75 bpm,a healthy range indicating good cardiovascular health.',
                      ),
                      swipableCard.InsightCard(
                        imagePath: 'assets/Rectangle.png',
                        text: 'You slept for 7.5 hours last night. Keep it up!',
                      ),
                      swipableCard.InsightCard(
                        imagePath: 'assets/Rectangle.png',
                        text: 'You walked 8,500 steps today. Keep moving!',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              height: 550, // Adjust height as needed
              child: ECGMonitor(),
            ),

            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const DateNavigationWidget(),
            ),

            const SizedBox(height: 20),

            // Ensure Vo2MaxWidget has a fixed height
            SizedBox(
              height: 350, // Set height as per your design
              child: const HeartRateGraph(),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Daily Summary",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        RestingCard(bpm: "70"),
                        const SizedBox(width: 10),
                        PeakCard(bpm: "120"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  DailySummaryWidget(),
                ],
              ),
            ),

            SizedBox(height: 20),
            HeartRateTrends(),

            const SizedBox(height: 20),

            // Quick Tips Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: const Text(
                      "Quick Tips",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(height: 0),
                  const SwipeableCardWidget(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Vo2MaxAnalysis(vo2level: "42.5"),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FactorsHeartRate(),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: OnlineDoctorConsultation(
                doctorName: "Dr.Kawsar Ahamed",
                doctorField: "Cardiologist",
                doctorDescription:
                    "Understand your heart data with expert advice",
              ),
            ),

            const SizedBox(height: 20),
            Padding(padding: const EdgeInsets.all(12.0), child: TalkToTvamev()),
          ],
        ),
      ),
    );
  }
}

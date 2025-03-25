import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_structure_reference/shared/widgets/close_slider_item_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/ecg_animation_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/heart_rate_graph.dart';
import 'package:mvvm_structure_reference/shared/widgets/swipable_card_widget.dart';

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
          onPressed: () {},
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
        child: ListView(
          children: [
            // Insights Section
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                  const HorizontalCardWidget(),
                ],
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              height: 450, // Adjust height as needed
              child: ECGMonitor(),
            ),

            const SizedBox(height: 50),

            // Ensure Vo2MaxWidget has a fixed height
            SizedBox(
              height: 300, // Set height as per your design
              child: const Vo2MaxWidget(),
            ),

            const SizedBox(height: 20),

            // Quick Tips Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Quick Tips",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 4),
                const SwipeableCardWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

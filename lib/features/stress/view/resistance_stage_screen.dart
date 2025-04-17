import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/stress/widgets/stress_stage_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/glucose_monitoring2.dart';

class ResistanceStageScreen extends StatelessWidget {
  const ResistanceStageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resistance Stage'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            SizedBox(height: 30),
            StressStageWidget(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GlucoseMonitoringContainer2(titles: ['Hello1']),
            ),
          ],
        ),
      ),
    );
  }
}

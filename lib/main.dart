import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/heart_rate/view/heart_rate_screen.dart';
import 'package:mvvm_structure_reference/shared/widgets/factors_heart_rate.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/v02_max_analysis.dart';
import 'package:mvvm_structure_reference/shared/widgets/online_doctor_consultation.dart';
import 'package:mvvm_structure_reference/shared/widgets/talk_to_tvamev.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        // body: Center(child: TalkToTvamev()),
        body: HeartRateScreen(),
      ),
    );
  }
}

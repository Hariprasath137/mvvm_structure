import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/v02_max_analysis.dart';

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
        body: Center(child: Vo2MaxAnalysis(vo2level: '42.5')),
        // body: HeartRateScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/config/app_constraints.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/bp_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      onGenerateRoute: AppRoutes.generateRoute,

      // initialRoute: AppRoutes.heartrate,
      initialRoute: AppRoutes.home,

      // home: Scaffold(body: HeartRateTrends()),
    );
  }
}

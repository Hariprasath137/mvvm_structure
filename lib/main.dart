import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/config/app_constraints.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_trends.dart';

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

      // onGenerateRoute: AppRoutes.generateRoute,
      // initialRoute: AppRoutes.hrtrends,
      home: Scaffold(body: HeartRateTrends()),
    );
  }
}

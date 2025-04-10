import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/config/app_constraints.dart';

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
      initialRoute: AppRoutes.home,
      // home: Scaffold(body: HeartRateTrends()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/config/app_constraints.dart';
import 'package:mvvm_structure_reference/di/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        onGenerateRoute: AppRoutes.generateRoute,

        // initialRoute: AppRoutes.heartrate,
        initialRoute: AppRoutes.bp,

        // home: Scaffold(body: HeartRateTrends()),
      ),
    );
  }
}
